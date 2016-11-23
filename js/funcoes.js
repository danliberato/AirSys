$(document).ready(function(){
    
    countAeronavesDiferentes();
    
    countAeronaves();
});

function addAeronave() {
    
    if(validaCamposAddAeronave()){
    
        var matricula = $("#matricula").val();
        var modelo = $("#modelo").val();
        var data_fabricacao = $("#data_fabricacao").val();
        var envergadura = $("#envergadura").val();
        var total_horas_voo = $("#total_horas_voo").val();
        var combustivel = $("#combustivel").val();
        var peso_aviao = $("#peso_aviao").val();
        var nro_poltronas = $("#nro_poltronas").val();
        var peso_maximo = $("#peso_maximo").val();
        var autonomia = $("#autonomia").val();
        var capacidade_bagagem = $("#capacidade_bagagem").val();
        var status = $("#status").val();
        var cnpj_companhia = $("#cnpj_companhia").val();
        var consumo = combustivel / autonomia;
        var operacao = "salvar";

           // Add record
           $.post("Controller/ajax/crudAeronave.php", {
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
           }, function (data) {
               //$(".records_content").html(data);
               alert(data);
               $("#add_aeronave_modal").modal("hide");
               atualizaTabela();
               limpaCamposForm();

           }).fail(function(textStatus, errorThrown) {
            console.error("Erro: " + textStatus, errorThrown);
          });
   }
}

function atualizaAeronave(){
    
    if(validaCamposUpdateAeronave()){
        
        var matricula = $("#update_matricula").val();
        var modelo = $("#update_modelo").val();
        var data_fabricacao = $("#update_data_fabricacao").val();
        var envergadura = $("#update_envergadura").val();
        var total_horas_voo = $("#update_total_horas_voo").val();
        var combustivel = $("#update_combustivel").val();
        var peso_aviao = $("#update_peso_aviao").val();
        var nro_poltronas = $("#update_nro_poltronas").val();
        var peso_maximo = $("#update_peso_maximo").val();
        var autonomia = $("#update_autonomia").val();
        var capacidade_bagagem = $("#update_capacidade_bagagem").val();
        var status = $("#update_status").val();
        var cnpj_companhia = $("#update_cnpj_companhia").val();
        var consumo = combustivel / autonomia;
        var operacao = "alterar";

           // Add record
           $.post("Controller/ajax/crudAeronave.php", {
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
        },function (retorno){
            //$(".records_content").html(retorno);
            $("#update_aeronave_modal").modal("hide");
            atualizaTabela();
            alert(retorno);
            limpaCamposForm();
            
        }).fail(function(textStatus, errorThrown) {
        console.error("Erro: " + textStatus, errorThrown);
      });
    }
}

function detalhesAeronave(matricula){
    
    $.post('Controller/ajax/crudAeronave.php',
    {matricula : matricula, 
        operacao: 'populaForm'},
    function(data){
        //$(".records_content").html(data);
        var aeronave = $.parseJSON(data)[0];
        
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
        $("#update_status").val(aeronave["status"]);
        $("#update_cnpj_companhia").val(aeronave["cnpj_companhia"]);
        
    })
    .fail(function(textStatus, errorThrown) {
        console.error("Erro: " + textStatus, errorThrown);
      });
}

function removeAeronave(id){
    
    if(confirm("Deseja deletar a aeronave de matrícula "+id+"?")){
        var operacao = "remover";

        $.post("Controller/ajax/crudAeronave.php", {
            matricula: id,
            operacao: operacao
        }, function () {
            alert("Aeronave excluída com sucesso!");
        })
        .fail(function(textStatus, errorThrown) {
            console.error("Erro: " + textStatus, errorThrown);
          });
    }
    setTimeout(atualizaTabela(),500);
}

function atualizaTabela() {

    $.post("Controller/ajax/crudAeronave.php", {
        matricula : $("#buscaMatricula").val(),
        cnpj_companhia : $("#buscaCompanhia").val(),
        status : $("#buscaStatus").val(),
        operacao: "buscar"
    }, function (data) {
        $(".records_content").html(data);
        countAeronavesDiferentes();
        countAeronaves();
    })
    .fail(function(textStatus, errorThrown) {
        console.error("Erro: " + textStatus, errorThrown);
    });    
}

function limpaCamposForm(){
    
    //campos do form de insert
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
    $("#status").val("selecione");
    $("#cnpj_companhia").val("selecione");
    //campos do forma de update
    $("#update_matricula").val("");
    $("#update_modelo").val("");
    $("#update_data_fabricacao").val("");
    $("#update_envergadura").val("");
    $("#update_total_horas_voo").val("");
    $("#update_combustivel").val("");
    $("#update_peso_aviao").val("");
    $("#update_nro_poltronas").val("");
    $("#update_peso_maximo").val("");
    $("#update_autonomia").val("");
    $("#update_capacidade_bagagem").val("");
    $("#update_status").val("selecione");
    $("#update_cnpj_companhia").val("selecione");
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


function validaCamposAddAeronave(){
    if($("#matricula").val() === ""){
        alert("Preencha o campo Matricula");
        return false;
    }else if($("#status").val() === "selecione"){
        alert("Selecione o Status");
        return false;
    }else if($("#cnpj_companhia").val() === "selecione"){
        alert("Selecione a Companhia Aérea");
        return false;
    }
    return true;
}

function validaCamposUpdateAeronave(){
    if($("#update_matricula").val() === ""){
        alert("Preencha o campo Matricula");
        return false;
    }else if($("#update_status").val() === "selecione"){
        alert("Selecione o Status");
        return false;
    }else if($("#update_cnpj_companhia").val() === "selecione"){
        alert("Selecione a Companhia Aéria");
        return false;
    }
    return true;
}
