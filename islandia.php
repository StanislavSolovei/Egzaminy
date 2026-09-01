<?php
    $conn = mysqli_connect("localhost", "root", "", "islandia");
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styl.css">
    <title>Islandia</title>
</head>
<body>
    <header>
        <h1><a href="islandia.php">Zwiedzaj Islandię</a></h1>
    </header>
    <aside>
        <h3>Do zwiedzania</h3>
        <ul>
            <li>Wodospady:
                <ol>
                <?php
                    $sql = "SELECT nazwa FROM `obiekty` WHERE panstwo = 'Islandia' AND idRodzaj = 10;";
                    $result = mysqli_query($conn, $sql);
                    while($row = $result -> fetch_assoc()){
                        echo "<li>" . $row['nazwa'] . "</li>";
                    }
                ?>
                </ol>
            </li>
            <li>Siedliska zwierząt:
                <ol>
                <?php
                    $sql = "SELECT nazwa FROM `obiekty` WHERE panstwo = 'Islandia' AND idRodzaj = 14;";
                    $result = mysqli_query($conn, $sql);
                    while($row = $result -> fetch_assoc()){
                        echo "<li>" . $row['nazwa'] . "</li>";
                    }
                ?>
                </ol>
            </li>
        </ul>
    </aside>
    
    <main>
        <h2>Galeria</h2>
        <section>
            <?php
                $sql = "SELECT idObiekt, plik, nazwa FROM `obiekty` WHERE panstwo = 'Islandia';";
                $result = mysqli_query($conn, $sql);
                while($row = $result -> fetch_assoc()){
                    $id = $row['idObiekt'];
                    $nazwa = $row['nazwa'];
                    $plik = $row['plik'];

                    echo "<a href='obiekty.php?idObiekt=$id'>";
                    echo "<img src='$plik' alt='$nazwa' title='$nazwa' class='miniatury'>";
                    echo "</a>";
                }
            ?>
        </section>
    </main>
    <footer>
        <hr>
        <p>Autor: 00000000000</p>
    </footer>
</body>
</html>

<?php
    $conn -> close();
?>