<?php

include("../ConexaoBD.php");

switch ($_POST['operacao']){
    case "salvar":
        persistAeronave("salvar");
        break;
    case "remover":
        remover();
        break;
    case "populaForm":
        populaFormDetalhes();
        break;
    case "buscar":
        buscar();
        break;
    case "alterar":
        persistAeronave("alterar");
        break;
    case "countDiff":
        countDiff();
        break;
    case "countAeronaves":
        countAeronaves();
        break;
    default :
}
    
    

function persistAeronave($operacao){
    
    $mysql = new ConexaoBD("localhost", "user", "123456", "test");
    
    
    $matricula = $_POST['matricula'];
    $modelo = isset($_POST['modelo']) ? $_POST['modelo'] : "";
    $data_fabricacao = isset($_POST['data_fabricacao']) ? $_POST['data_fabricacao'] : "";
    $envergadura = isset($_POST['envergadura']) ? $_POST['envergadura'] : "";
    $total_horas_voo = isset($_POST['total_horas_voo']) ? $_POST['total_horas_voo'] : "";
    $combustivel = isset($_POST['combustivel']) ? $_POST['combustivel'] : "";
    $peso_aviao = isset($_POST['peso_aviao']) ? $_POST['peso_aviao'] : "";
    $nro_poltronas = isset($_POST['nro_poltronas']) ? $_POST['nro_poltronas']  : "";
    $peso_maximo = isset($_POST['peso_maximo']) ? $_POST['peso_maximo'] : "";
    $consumo = isset($_POST['consumo']) ? $_POST['consumo'] : "";
    $autonomia = isset($_POST['autonomia']) ? $_POST['autonomia'] : "";
    $capacidade_bagagem = isset($_POST['capacidade_bagagem']) ? $_POST['capacidade_bagagem'] : "";
    $status = $_POST['status'];
    $cnpj_cia = $_POST['cnpj_companhia'];

    if($operacao == "salvar"){
        $rs = $mysql->executeQuery("SELECT COUNT(matricula) as qtd FROM aeronave WHERE matricula = '".$_POST['matricula']."';");
        
        if($rs["qtd"] == 0){
            $query = "INSERT INTO aeronave VALUES('$matricula', '$modelo', '$data_fabricacao', '$envergadura', '$total_horas_voo', "
                    . "'$combustivel', '$peso_aviao', '$nro_poltronas', '$peso_maximo', '$consumo', '$autonomia', "
                    . "'$capacidade_bagagem', '$status', '$cnpj_cia')";

            $rs = $mysql->executeQuery($query);
            $retorno = "Dados da aeronave inseridos com sucesso!";
        }else{
            $retorno = "Aeronave já existente no sistema!";
        }
    }else{
        
        $rs = $mysql->executeQuery("SELECT COUNT(matricula) as qtd FROM aeronave WHERE matricula = '".$_POST['matricula']."';");
        
        $query = "UPDATE aeronave SET matricula = '$matricula', modelo = '$modelo', data_fabricacao = '$data_fabricacao', "
                . "envergadura = '$envergadura', total_horas_voo = '$total_horas_voo', combustivel ='$combustivel', "
                . "peso_aviao = '$peso_aviao', nro_poltronas = '$nro_poltronas', peso_maximo = '$peso_maximo', consumo = '$consumo', "
                . "autonomia = '$autonomia', capacidade_bagagem = '$capacidade_bagagem', status = '$status', "
                . "cnpj_companhia = '$cnpj_cia' WHERE matricula = '".$matricula."';";

        $rs = $mysql->executeQuery($query);
        $retorno = "Aeronave de matrícula ".$matricula." alterada com sucesso!";
    }

    echo $retorno;

        
}

function buscar(){
    
    $status;
    $tabela = '<table class="table table-bordered table-striped text-center">
                        <tr>
                            <th>Nº</th>
                            <th>Modelo</th>
                            <th>Matrícula</th>
                            <th>Peso</th>
                            <th>Capacidade</th>
                            <th>Autonomia</th>
                            <th>Status</th>
                            <th>Companhia</th>
                            <th>Opções</th>
                        </tr>';
    
    $mysql = new ConexaoBD("localhost", "user", "123456", "test");
    
    if(isset($_POST['status']) && ($_POST['status'] != "selecione")){
        $status = ' = "'. $_POST['status'].'"';
    }else{
        $status = ' <> "INATIVO"';
    }
    
    $query = 'SELECT * FROM aeronave WHERE status '.$status.'';
    
    if(isset($_POST['matricula'])){ $query .= ' AND matricula LIKE "'.$_POST['matricula'].'%"';}
    
    if(isset($_POST['cnpj_companhia']) && ($_POST['cnpj_companhia'] != "selecione")){ $query .= ' AND cnpj_companhia = '.$_POST['cnpj_companhia'];}
    
    $query .= ' ORDER BY modelo, matricula ASC';
    
    $result = $mysql->executeQuery($query);

        $count = 0;
        $botaoDeletar = '';

        foreach ($result as $row){

            if($row['status'] != 'INATIVO'){
                $botaoDeletar = '<button onclick="removeAeronave(\''.$row['matricula'].'\')" class="btn btn-danger">Deletar</button>';
            }
            
            $tabela .= '<tr>
                <td>'.++$count.'</td>
                <td>'.$row['modelo'].'</td>
                <td>'.$row['matricula'].'</td>
                <td>'.$row['peso_aviao'].' Kg</td>
                <td>'.$row['capacidade_bagagem'].' Kg</td>
                <td>'.$row['autonomia'].' Km</td>
                <td>'.$row['status'].'</td>
                <td>'.$row['cnpj_companhia'].'</td>

                <td>
                    <button onclick="detalhesAeronave(\''.$row['matricula'].'\')" class="btn btn-info" data-toggle="modal" data-target="#update_aeronave_modal">Visualizar</button>
                    '.$botaoDeletar.'
                </td>
            </tr>';
            
        }
    
    if($count == 0){
         $tabela .= '<tr><td colspan="9" text-center><h4><b>Nenhum registro encontrado!</b></h4></td></tr>';
    }
    
    $tabela .= '</table>';
    
    echo $tabela;
}

function populaFormDetalhes(){
    
    $mysql = new ConexaoBD("localhost", "user", "123456", "test");
    
    $query = 'SELECT * FROM aeronave WHERE matricula = "'.$_POST['matricula'].'"';
    
    $rs = $mysql->executeQuery($query);
    
    foreach ($rs as $row){
        $dados[] = [
            "matricula" => $row['matricula'],
            "modelo" => $row['modelo'],
            "data_fabricacao" => $row['data_fabricacao'],
            "envergadura" => $row['envergadura'],
            "total_horas_voo" => $row['total_horas_voo'],
            "combustivel" => $row['combustivel'],
            "peso_aviao" => $row['peso_aviao'],
            "nro_poltronas" => $row['nro_poltronas'],
            "peso_maximo" => $row['peso_maximo'],
            "consumo" => $row['consumo'],
            "autonomia" => $row['autonomia'],
            "capacidade_bagagem" => $row['capacidade_bagagem'],
            "status" => $row['status'],
            "cnpj_companhia" => $row['cnpj_companhia']];
    }
    echo json_encode($dados);
}

function remover(){

    $mysql = new ConexaoBD("localhost", "user", "123456", "test");
    
    $query = 'UPDATE aeronave SET status = "INATIVO" WHERE matricula = "'.$_POST['matricula'].'"';
    
    $mysql->executeQuery($query);
}

function countDiff(){
    $mysql = new ConexaoBD("localhost", "user", "123456", "test");
    
    $query = 'SELECT COUNT(DISTINCT(modelo)) as qtd FROM aeronave;';
    
    $rs = $mysql->executeQuery($query);
    
    $data = mysqli_fetch_assoc($rs);
    echo $data['qtd'];
}

function countAeronaves(){
    
    $mysql = new ConexaoBD("localhost", "user", "123456", "test");
    
    $query = 'SELECT COUNT(modelo) as qtd FROM aeronave;';
    
    $rs = $mysql->executeQuery($query);
    
    $data = mysqli_fetch_assoc($rs);
    echo $data['qtd'];
}