<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, DELETE, POST, PUT");
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    require 'config.php';

    $data = file_get_contents("php://input");
    if ($data) {
        $receivedData = json_decode($data,true);
        switch ($receivedData["functionToExecute"]) {
            case 'signInUser':
                echo _getUser($receivedData["_login"], $receivedData["_password"]);
            break;
        }
    } else {
        $result['status'] = 100;
        $result['message'] = "No Data received";
        echo json_encode($result);
    }



