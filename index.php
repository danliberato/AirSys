<?php
header('Content-Type: text/html; charset=utf-8');
mysqli_report(MYSQLI_REPORT_STRICT);
include_once("Controller/ConexaoBD.php");

$rsCompanhia = $mysql->executeQuery("SELECT * FROM companhia ORDER BY nome ASC");

$optionsCompanhia = "";

while ($companhia = mysqli_fetch_assoc($rsCompanhia)) {
    $optionsCompanhia .= '<option value="'.$companhia['cnpj'].'">'.utf8_encode($companhia['nome']).'</option>';
}
?>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="icon.ico" >
    <link href="css/estilo.css" rel="stylesheet">
    <link href="css/w3.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <title>Cadastro de Aeronaves</title>
  </head>
  <body>
        <!-- ALERT para notific-->
        <div class="container-fluid">
            <div id="cabecalho" class="w3-top row">
                <ul class="w3-navbar w3-white w3-wide w3-padding-8 w3-card-2">
                    <li>
                        <a href="#slideShow" class="w3-margin-left"><b>AirSys</b> Sistemas de aeroportos</a>
                    </li>
                    <li class="w3-right w3-hide-small">
                        <a href="#refBusca" class="w3-left">Cadastro de Aeronave</a>
                        <a href="#relatorios" class="w3-left">Relatórios</a>
                    </li>
                </ul>
            </div>
            <!-- SLIDESHOW -->
            <div id="slideShow" class="">
                <?php include_once './View/slideshow.php';?>
            </div>
            <div id="busca" class="row col-sm-10 col-sm-offset-1">
                <div class="col-sm-2">
                    <h4>Buscar Aeronaves:</h4>
                </div>
                <div class="col-sm-3">
                    <select class="form-control" id="buscaCompanhia" onchange="atualizaTabela()">
                        <option value="selecione">Companhia aérea...</option>
                        <?php
                            echo $optionsCompanhia;
                        ?>
                    </select>
                </div>
                <div class="form-group col-sm-2">
                    <select class="form-control" id="buscaStatus" onchange="atualizaTabela()">
                        <option value="selecione">Status...</option>
                        <option value="ATIVO">Ativo</option>
                        <option value="EM_VOO">Em vôo</option>
                        <option value="EM_MANUTENCAO">Em manutenção</option>
                        <option value="SOB_PERICIA">Sob perícia</option>
                        <option value="INATIVO">Inativo</option>
                    </select>
                </div>
                <div class="input-group col-sm-2 pull-left" style="z-index: 0">
                    <input id="buscaMatricula" type="text" class="form-control" placeholder="Pesquisar por matrícula" aria-describedby="basic-addon1" maxlength="11">
                    <span class="input-group-btn">
                        <button class="btn btn-primary" onclick="atualizaTabela()" type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                </div>
                <div id="btnAdicionarAeronave" class="btn-group col-sm-2 pull-right">
                    <button class="btn btn-success" data-toggle="modal" data-target="#add_aeronave_modal">Adicionar aeronave</button>
                </div>
            </div>
            <div id="infos" class="row col-sm-10 col-sm-offset-1">
                <div class="input-group col-sm-2 pull-right">
                    <button class="btn btn-primary" type="button" onclick="countAeronavesDiferentes()">
                        Aeronaves diferentes <span id="countAeronavesDiff" class="badge"></span>
                    </button>
                </div>
                <div class="input-group col-sm-2">
                    <button class="btn btn-primary" type="button" onclick="countAeronaves()">
                        Total de Aeronaves <span id="countAeronaves" class="badge"></span>
                    </button>
                </div>
            </div>
            <div id="resultado" class="row col-sm-10 col-sm-offset-1">
                <!-- Content Section -->
                <div class="records_content">
                    <!-- Bootstrap Modals -->
                </div>
                <?php include_once './View/modals.php';?>
            </div>
            <div id="relatorios" class="row col-sm-10 col-sm-offset-1">
                <h3>Relatórios</h3>
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="#">Vôos</a></li>
                    <li role="presentation"><a href="#">Companhias</a></li>
                </ul>
            </div>
        </div>
        <!-- Footer -->
        <footer class="w3-container w3-padding-32 w3-dark-grey">
            <?php include_once './View/footer.php';?>
        </footer>
        <!-- /Footer -->
        <!-- scripts no fim para agilizar o carregamento da página -->
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/funcoes.js"></script>
    </body>
</html>
