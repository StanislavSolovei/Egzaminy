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
        <h2>Opis Miejsca</h2>
        <section>
            <?php
                if(isset($_GET['idObiekt'])){
                    $id = $_GET['idObiekt'];
                    $sql = "SELECT plik, nazwa, nazwaCechy, wartoscCechy, opis, rodzaj FROM `obiekty` JOIN `rodzaje` ON obiekty.idRodzaj = rodzaje.idRodzaj WHERE idObiekt = $id;";
                    $result = mysqli_query($conn, $sql);
                    while($row = $result -> fetch_assoc()){
                        echo "<img src = '$row[plik]'" . "alt = '$row[nazwa]'";
                        echo "<br>";
                        echo "<h2>  $row[nazwa]  </h2>";
                        echo "<h3>  $row[rodzaj]  </h3>";
                        echo "<p> $row[nazwaCechy]: $row[wartoscCechy] </p>";
                        echo "<p> $row[opis] </p>";
                    }
                };
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
