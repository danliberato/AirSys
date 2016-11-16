$(document).ready(function(){
    
    atualizaTabela();
    
    countAeronavesDiferentes();
    
    countAeronaves();
});

function addAeronave() {
    // get values
    var matricula = $("#matricula").val();
    var modelo = $("#modelo").val();
    var data_fabricacao = $("#data_fabricacao").val();
    var envergadura = $("#envergadura").val();
    var total_horas_voo = $("#total_horas").val();
    var combustivel = $("#combustivel").val();
    var peso_aviao = $("#peso_aviao").val();
    var nro_poltronas = $("#nro_poltronas").val();
    var peso_maximo = $("#peso_maximo").val();
    var autonomia = $("#autonomia").val();
    var capacidade_bagagem = $("#bagagem").val();
    var status = $("#status").val();
    var cnpj_companhia = $("#cnpj_companhia").val();
    var consumo = combustivel / autonomia;
    var operacao = "salvar";
 
    if(validaCamposAddAeronave()){
       // Add record
       $.post("ajax/crudAeronave.php", {
           matricula : matricula,
           modelo: modelo,
           data_fabricacao: data_fabricacao,
           envergadura: envergadura,
           total_horas_voo: total_horas_voo,
           combustivel: combustivel,
           peso_aviao: peso_aviao,
           nro_poltronas: nro_poltronas,
           peso_maximo: peso_maximo,
           autonomia: autonomia,
           capacidade_bagagem: capacidade_bagagem,
           status: status,
           cnpj_companhia: cnpj_companhia,
           consumo: consumo,
           operacao: operacao
       }, function (data, status) {
           // close the popup
           $("#add_aeronave_modal").modal("hide");

           // read records again
           atualizaTabela()();
           
           limpaCamposForm();
              
       });
   }
}

function validaCamposAddAeronave(){
    if($("#matricula").val() === ""){
        alert("Preencha o campo Matricula");
    }else if($("#status").val() === "selecione"){
        alert("Selecione o Status");
    }else if($("#cnpj_companhia").val() === "selecione"){
        alert("Selecione a Companhia Aéria");
    }
    
}

function atualizaTabela() {

    $.post("Controller/ajax/crudAeronave.php", {
        cnpj_companhia : $("#buscaCompanhia").val(),
        status : $("#buscaStatus").val(),
        operacao: "buscar"
    }, function (data, status) {
        $(".records_content").html(data);
    })
    .fail(function(textStatus, errorThrown) {
        console.error("Erro: " + textStatus, errorThrown);
    });
    
}

function detalhesAeronave(id){
    
    $.post('Controller/ajax/crudAeronave.php',
    {matricula : id, operacao: 'populaForm'},
    function(data){
        //$(".records_content").html(obj);
        $.each($.parseJSON(data), function(i, aeronave){
            $("#update_matricula").val(aeronave["matricula"]);
            $("#update_modelo").val(aeronave["modelo"]);
            $("#update_data_fabricacao").val(aeronave["data_fabricacao"]);
            $("#update_envergadura").val(aeronave["envergadura"]);
            $("#update_total_horas_voo").val(aeronave["total_horas_voo"]);
            $("#update_combustivel").val(aeronave["combustivel"]);
            $("#update_peso_aviao").val(aeronave["peso_aviao"]);
            $("#update_nro_poltronas").val(aeronave["nro_poltronas"]);
            $("#update_peso_maximo").val(aeronave["peso_maximo"]);
            $("#update_autonomia").val(aeronave["autonomia"]);
            $("#update_capacidade_bagagem").val(aeronave["capacidade_bagagem"]);
            $("#update_status").select(aeronave["status"]);
            $("#update_cnpj_companhia").select(aeronave["cnpj_companhia"]);
            
        }); 
    })
    .fail(function(textStatus, errorThrown) {
        console.error("Erro: " + textStatus, errorThrown);
      });
}

function atualizaAeronave(){
    var matricula = $("#update_matricula").val();
    var modelo = $("#update_modelo").val();
    var data_fabricacao = $("#update_data_fabricacao").val();
    var envergadura = $("#update_envergadura").val();
    var total_horas_voo = $("#update_total_horas").val();
    var combustivel = $("#update_combustivel").val();
    var peso_aviao = $("#update_peso_aviao").val();
    var nro_poltronas = $("#update_nro_poltronas").val();
    var peso_maximo = $("#update_peso_maximo").val();
    var autonomia = $("#update_autonomia").val();
    var capacidade_bagagem = $("#update_bagagem").val();
    var status = $("#update_status").val();
    var cnpj_companhia = $("#update_cnpj_companhia").val();
    var consumo = combustivel / autonomia;
    var operacao = "alterar";
    
    $.post("Controller/ajax/crudAeronave.php",{
        matricula: matricula,
        modelo : modelo,
        data_fabricacao : data_fabricacao,
        envergadura : envergadura,
        total_horas_voo : total_horas_voo,
        combustivel : combustivel,
        peso_aviao : peso_aviao,
        nro_poltronas : nro_poltronas,
        peso_maximo : peso_maximo,
        autonomia : autonomia,
        capacidade_bagagem : capacidade_bagagem,
        status : status,
        cnpj_companhia : cnpj_companhia,
        consumo : consumo,
        operacao : operacao
    },function (retorno){
        alert(retorno.toString());
    }).fail()
    .fail(function(textStatus, errorThrown) {
        console.error("Erro: " + textStatus, errorThrown);
      });
            
}

function removeAeronave(id){
        
        var operacao = "remover";

    $.post("Controller/ajax/crudAeronave.php", {
        operacao: operacao
    }, function (data, status) {
        $(".records_content").html(data);
    })
    .fail(function(textStatus, errorThrown) {
        console.error("Erro: " + textStatus, errorThrown);
      });
        
}


function limpaCamposForm(){
    
    $("#matricula").val("");
    $("#modelo").val("");
    $("#data_fabricacao").val("");
    $("#envergadura").val("");
    $("#total_horas_voo").val("");
    $("#combustivel").val("");
    $("#peso_aviao").val("");
    $("#nro_poltronas").val("");
    $("#peso_maximo").val("");
    $("#autonomia").val("");
    $("#capacidade_bagagem").val("");
    $("#status").val("");
    $("#cnpj_companhia").val("");
}

function countAeronavesDiferentes(){
    
    var operacao = "countDiff";

    $.post("Controller/ajax/crudAeronave.php", {
        operacao: operacao
    }, function (data) {
        $("#countAeronavesDiff").html(data);
    })
    .fail(function(textStatus, errorThrown) {
        console.error("Erro: " + textStatus, errorThrown);
      });
    
}

function countAeronaves(){
    
    var operacao = "countAeronaves";

    $.post("Controller/ajax/crudAeronave.php", {
        operacao: operacao
    }, function (data) {
        $("#countAeronaves").html(data);
    })
    .fail(function(textStatus, errorThrown) {
        console.error("Erro: " + textStatus, errorThrown);
      });
    
}