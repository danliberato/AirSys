/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    
    countAeronavesDiferentes();
    
    countAeronaves();
    
    $('.date').mask('11/11/1111');
        $('.time').mask('00:00:00');
        $('.date_time').mask('00/00/0000 00:00:00');
        $('.cep').mask('00000-000');
        $('.phone').mask('0000-0000');
        $('.phone_with_ddd').mask('(00) 0000-0000');
        $('.phone_us').mask('(000) 000-0000');
        $('.mixed').mask('AAA 000-S0S');
        $('.cpf').mask('000.000.000-00', {reverse: true});
        $('.money').mask('000.000.000.000.000,00', {reverse: true});
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
        limpaCamposForm();
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
        
        getVoosByAeronave(aeronave["matricula"]);
        getMecanicosByAeronave(aeronave["matricula"]);
    })
    .fail(function(textStatus, errorThrown) {
        console.error("Erro: " + textStatus, errorThrown);
      });
}

/*
 * Search for all flights of an aircraft
 * @param {string} matricula
 * @returns {A table (html) with all flights}
 */
function getVoosByAeronave(matricula){
    
    $.post('Controller/ajax/crudAeronave.php',
    {matricula : matricula, 
        operacao: 'getVoos'},
    function(data){
        //$(".records_content").html(data);
        //$("#tab_voos").html(data);
        $('<table></table>').addClass('table table-bordered table-striped text-center').attr({id: 'table_voos'}).appendTo("#tab_voos");
        var tr = $('<tr></tr>').appendTo("#table_voos");
        $('<th>Nº Vôo</th>').appendTo(tr);
        $('<th>Data/Hora</th>').appendTo(tr);
        $('<th>Origem</th>').appendTo(tr);
        $('<th>Destino</th>').appendTo(tr);
        $('<th>Embarque</th>').appendTo(tr);
        $.each($.parseJSON(data), function(i, voo){
            var trVoos = $('<tr></tr>').appendTo("#table_voos");
            $('<td>'+voo['nro_voo']+'</td>').appendTo(trVoos);
            $('<td>'+voo['data_hora']+'</td>').appendTo(trVoos);
            $('<td>'+voo['aeroporto_origem']+'</td>').appendTo(trVoos);
            $('<td>'+voo['aeroporto_destino']+'</td>').appendTo(trVoos);
            $('<td>'+voo['portao_embarque']+'</td>').appendTo(trVoos);
        });
        
    })
    .fail(function(textStatus, errorThrown) {
        console.error("Erro: " + textStatus, errorThrown);
      });
}

/*
 * 
 * @param {type} matricula
 * @returns {A table (html) with all mecanichs ever involved in an aircraft keeping}
 */
function getMecanicosByAeronave(matricula){
    
    $.post('Controller/ajax/crudAeronave.php',
    {matricula : matricula, 
        operacao: 'getMecanicos'},
    function(data){
        //$(".records_content").html(data);
        $('<table></table>').addClass('table table-bordered table-striped text-center').attr({id: 'table_mecanicos'}).appendTo("#tab_mecanicos");
        var tr = $('<tr></tr>').appendTo("#table_mecanicos");
        $('<th>Ordem Serviço</th>').appendTo(tr);
        $('<th>CPF</th>').appendTo(tr);
        $('<th>Nome</th>').appendTo(tr);
        $('<th>Endereço</th>').appendTo(tr);
        $.each($.parseJSON(data), function(i, mecanico){
            var trMecanicos = $('<tr></tr>').appendTo("#table_mecanicos");
            $('<td>'+mecanico['ordem_servico']+'</td>').appendTo(trMecanicos);
            $('<td>'+mecanico['cpf_mecanico']+'</td>').addClass('cpf').appendTo(trMecanicos);
            $('<td>'+mecanico['nome']+'</td>').appendTo(trMecanicos);
            $('<td>'+mecanico['endereco']+'</td>').appendTo(trMecanicos);
        });
        
    })
    .fail(function(textStatus, errorThrown) {
        console.error("Erro: " + textStatus, errorThrown);
      });
      
}

/**
 * Delete aircraft (Actually just change aircraft status to "INATIVO" (unable))
 * @param {string} matricula
 * @returns {alert() if success or javascript error}
 */
function removeAeronave(){
    
    var matricula = $("#update_matricula").val();
    var operacao = "remover";
    
    if(confirm("Deseja deletar a aeronave de matrícula "+matricula+"?")){

        $.post("Controller/ajax/crudAeronave.php", {
            matricula: matricula,
            operacao: operacao
        }, function () {
            alert("Aeronave excluída com sucesso!");
        })
        .fail(function(textStatus, errorThrown) {
            alert("Ocorreu um erro na exclusão!");
            console.error("Erro: " + textStatus, errorThrown);
          });
    }
    $("#update_aeronave_modal").modal("hide");
    limpaCamposForm();
    setTimeout(atualizaTabela(),500);
}

/*
 * Update main table based on options set for searching.
 * @returns {undefined}
 */
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


/*
 * Clear all modal fields (add and update modals)
 */
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
    $("#tab_voos").html("");
    $("#tab_mecanicos").html("");
}

/*
 * Count how many different aircraft models are in the system
 */
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

/*
 * Count how many aircrafts are in the system
 */
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

/*
 * Check all fields before add an aircraft.
 */
function validaCamposAddAeronave(){
    if($("#matricula").val() === ""){
        alert("Preencha o campo Matricula");
        return false;
    }else if($("#cnpj_companhia").val() === "selecione"){
        alert("Selecione a Companhia Aérea");
        return false;
    }
    return true;
}

/*
 * Check all fields before update an aircraft.
 */
function validaCamposUpdateAeronave(){
    if($("#update_matricula").val() === ""){
        alert("Preencha o campo Matricula");
        return false;
    }else if($("#update_cnpj_companhia").val() === "selecione"){
        alert("Selecione a Companhia Aéria");
        return false;
    }
    return true;
}
