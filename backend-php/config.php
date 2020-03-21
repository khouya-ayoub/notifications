<?php
/*  this file is required to access to DB base and it contains all functions
 *  required for all type of manipulations
 */
    function _getConnexion() {
        // function for getting connexion
        try {
            $conn = new PDO("mysql:host=localhost:3306;dbname=mobilitypush", "root", "");
            // set the PDO error mode to exception
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
          } catch(PDOException $e){
            $conn = null;
          }
          return $conn;
    }

    // second bloc function two 202
    function _getUser($userLogin, $userPass) {
        // function for getting an user
        $conn = _getConnexion();
        if ($conn == null ) {
            return;
        }
        // sql query
        $sql = $conn->prepare("SELECT MUS_NOM, MUS_PRENOM, MUS_FONCTION FROM MB_USERS WHERE MUS_LOGIN=? and MUS_PASSWORD=?");
        $sql->execute(array($userLogin,$userPass));
        $result = $sql->fetch(PDO::FETCH_ASSOC);
        // add status to the results
        if ($result) {
            $result['autorisation'] = true;
        } else {
            $result['autorisation'] = false;
        }
        // creat JSON Object
        return json_encode($result);
    }

    function _modifyStatNotif() {
        // this function is used to modify field ETAT_NOTIF
    }

?>
