<?php

$mysql = new ConexaoBD("localhost", "user", "123456", "test");

class ConexaoBD{
    
    private $host;
    private $user;
    private $password;
    private $database;
    
    private $query;
    private $link;
    private $result;
    
    function ConexaoBD(){
        
    }
    
    function __construct($host,$user,$pass,$db){
        $this->host = $host;
        $this->user = $user;
        $this->password = $pass;
        $this->database = $db;
    }
    
    function connect(){
        $this->link = mysqli_connect($this->host, $this->user, $this->password);
        if(!$this->link){
            echo "Erro: ".mysqli_error();
            die();
        }elseif(!mysqli_select_db($this->link, $this->database)){
            echo "Não foi possivel conectar ao banco de dados\n";
            echo "Erro: ".mysqli_error();
            die();
        }
    }
    
    function disconnect(){
        return mysqli_close($this->link);
    }
    
    function executeQuery($query){
        $this->connect();
        $this->query = $query;
        
        $this->result = mysqli_query($this->link, $this->query);
        if($this->result){
            $this->disconnect();
            return $this->result;
        }else{
            echo "Erro ao executar SQL:".  mysqli_error();
            die();
            $this->disconnect();
        }
    }
    
    
}