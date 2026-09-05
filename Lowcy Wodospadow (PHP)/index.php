<?php
    $conn = mysqli_connect('localhost', 'root', '', 'wodospady');
?>


<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styl.css">
    <title>Wodospady</title>
</head>
<body>
    <header>
        <h2>Łowcy wodospadów</h2>
    </header>
    <main>
        <aside>
            <?php
                $sql = "SELECT idKontynent, nazwa FROM `kontynenty`;";
                $result = mysqli_query($conn, $sql);
                while($row = $result -> fetch_assoc()){
                    echo "<a href='index.php?idKontynent=$row[idKontynent]'>";
                    echo "$row[nazwa]";
                    echo "</a>";
                }
            ?>
        </aside>
        <section>
            <table>
                <tr>
                    <th>Identyfikator</th>
                    <th>Państwo</th>
                    <th>Nazwa Wodospadu</th>
                    <th>Wysokość</th>
                </tr>
                <?php
                    if(isset ($_GET['idKontynent'])){
                        $id = $_GET['idKontynent'];
                    } else {
                        $id = 6;
                    } 
                    $sql = "SELECT idObiekt, panstwo, nazwa, wartoscCechy FROM `obiekty` WHERE idRodzaj = 10 AND idKontynent = $id;";
                    $result = mysqli_query($conn, $sql);
                    while($row = $result -> fetch_assoc()){
                        echo "<tr>";
                        echo "<td>$row[idObiekt]</td>";
                        echo "<td>$row[panstwo]</td>";
                        echo "<td>$row[nazwa]</td>";
                        echo "<td>$row[wartoscCechy]</td>";
                        echo "</tr>";
                    }
                ?>
            </table>
            <h4>Wpisz osiągnięcie do bazy</h4>
            <form method="post" action="index.php">
                <label for="identyfikator">identyfikator wodospadu</label>
                <input type="number" name="identyfikator" id="identyfikator">
                <label for="turyst">turysta</label>
                <select name="turyst" id="turyst">
                    <?php
                        $sql = "SELECT idTurysta, nick FROM `turysci`;";
                        $result = mysqli_query($conn, $sql);
                        while($row = $result -> fetch_assoc()){
                            echo "<option value=$row[idTurysta]>";
                            echo "$row[nick]";
                            echo "</option>";
                        }
                    ?>
                </select>
                <button type="submit">Wpisz</button>
                <?php
                    if(isset($_POST['identyfikator']) && ($_POST['turyst'])){
                        $id = $_POST['identyfikator'];
                        $turyst = $_POST['turyst'];
                        $sql = "INSERT INTO `osiagniecia`(`idObiekt`, `idTurysta`) VALUES ($id, $turyst);";
                        $result = mysqli_query($conn, $sql);
                    }
                ?>
            </form>
        </section>
    </main>
    <article>
        <h3>Wodospady w Polsce</h3>
        <img src="kamienczyk.jpg" alt="wodospad">
        <img src="siklawica.jpg" alt="wodospad">
        <img src="siklawa.jpg" alt="wodospad">
        <img src="wilczki.jpg" alt="wodospad">
    </article>
    <footer>
        <p>Autor: 00000000000</p>
    </footer>
</body>
</html>

<?php
    $conn -> close();
?>