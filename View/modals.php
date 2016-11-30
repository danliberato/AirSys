<?php
/**
 * Description of modals
 * 
 * @author daan
 */
?>
<link href="css/estilo.css" rel="stylesheet">
    <link href="css/w3.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Modal - Insert Aeronave -->
<div class="modal fade" id="add_aeronave_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Cadastro de Aeronave</h4>
            </div>
            <div class="modal-body">
                <div class="form-group col-sm-4">
                    <label for="matricula">Matrícula</label>
                    <input type="text" id="matricula" placeholder="Matrícula" class="form-control" maxlength="11"/>
                </div>

                <div class="form-group col-sm-8">
                    <label for="modelo">Modelo</label>
                    <input type="text" id="modelo" placeholder="Modelo" class="form-control" maxlength="90" />
                </div>

                <div class="form-group col-sm-4">
                    <label for="data_fabricacao">Data de Fabricação</label>
                    <input type="date" id="data_fabricacao" placeholder="Data" class="form-control" maxlength="8"/>
                </div>

                <div class="form-group col-sm-3">
                    <label for="envergadura">Envergadura</label>
                    <input type="text" id="envergadura" placeholder="Envergadura (m)" class="form-control" maxlength="4"/>
                </div>

                <div class="form-group col-sm-5">
                    <label for="total_horas_voo">Total de horas voadas</label>
                    <input type="text" id="total_horas_voo" placeholder="Horas" class="form-control" />
                </div>

                <div class="form-group col-sm-4">
                    <label for="peso_aviao">Peso da Aeronave</label>
                    <input type="text" id="peso_aviao" placeholder="em quilogramas..." class="form-control" maxlength="5" />
                </div>

                <div class="form-group col-sm-3">
                    <label for="combustivel">Combustível</label>
                    <input type="text" id="combustivel" placeholder="em litros..." class="form-control" maxlength="5" />
                </div>

                <div class="form-group col-sm-5">
                    <label for="peso_maximo">Peso máximo de decoalgem</label>
                    <input type="text" id="peso_maximo" placeholder="em quilogramas..." class="form-control" />
                </div>

                <div class="form-group col-sm-4">
                    <label for="nro_poltronas">Número de poltronas</label>
                    <input type="text" id="nro_poltronas" placeholder="" class="form-control" />
                </div>

                <div class="form-group col-sm-3">
                    <label for="autonomia">Autonomia</label>
                    <input type="text" id="autonomia" placeholder="em quilometros..." class="form-control" />
                </div>

                <div class="form-group col-sm-5">
                    <label for="capacidade_bagagem">Capacidade de Bagagem</label>
                    <input type="text" id="capacidade_bagagem" placeholder="em quilogramas..." class="form-control" />
                </div>

                <div class="form-group col-sm-4">
                    <label for="status">Status</label>
                    <select class="form-control" id="status">
                        <option value="ATIVO" selected>Ativo</option>
                        <option value="EM_VOO">Em vôo</option>
                        <option value="EM_MANUTENCAO">Em manutenção</option>
                        <option value="SOB_PERICIA">Sob perícia</option>
                        <option value="INATIVO">Inativo</option>
                    </select>
                </div>

                <div class="form-group col-sm-8">
                    <label for="cnpj_companhia">Companhias</label>
                    <select class="form-control" id="cnpj_companhia">
                        <option value="selecione">Selecione...</option>
                        <?php
                            echo $optionsCompanhia;
                        ?>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" onclick="addAeronave()">Salvar</button>
            </div>
        </div>
    </div>
</div>
<!-- FIM Modal - Insert Aeronave -->
<!-- Modal - Update Aeronave -->
<div class="modal fade" id="update_aeronave_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Detalhes da Aeronave</h4>
            </div>
                <div id="update_detalhes" class="col-sm-12 container">
                    <ul class="nav nav-tabs">
                        <li role="presentation" class="active"><a href="#tab_detalhes" data-toggle="tab">Detalhes</a></li>
                        <li role="presentation" ><a href="#tab_voos" data-toggle="tab">Vôos</a></li>
                        <li role="presentation"><a href="#tab_mecanicos" data-toggle="tab">Manutenções</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="modal-body tab-pane active" id="tab_detalhes">

                <div class="form-group col-sm-4">
                    <label for="update_matricula">Matrícula</label>
                    <input type="text" id="update_matricula" placeholder="Matrícula" class="form-control" maxlength="11" disabled/>
                </div>

                <div class="form-group col-sm-8">
                    <label for="update_modelo">Modelo</label>
                    <input type="text" id="update_modelo" placeholder="Modelo" class="form-control" maxlength="90" />
                </div>

                <div class="form-group col-sm-4">
                    <label for="update_data_fabricacao">Data de Fabricação</label>
                    <input type="date" id="update_data_fabricacao" placeholder="Data" class="form-control" maxlength="8"/>
                </div>

                <div class="form-group col-sm-3">
                    <label for="update_envergadura">Envergadura</label>
                    <input type="text" id="update_envergadura" placeholder="Envergadura (m)" class="form-control" maxlength="4" />
                </div>

                <div class="form-group col-sm-5">
                    <label for="update_total_horas_voo">Total de horas voadas</label>
                    <input type="text" id="update_total_horas_voo" placeholder="Horas" class="form-control" />
                </div>

                <div class="form-group col-sm-4">
                    <label for="update_peso_aviao">Peso da Aeronave</label>
                    <input type="text" id="update_peso_aviao" placeholder="em quilogramas..." class="form-control" maxlength="5" />
                </div>

                <div class="form-group col-sm-3">
                    <label for="update_combustivel">Combustível</label>
                    <input type="text" id="update_combustivel" placeholder="em litros..." class="form-control" maxlength="5" />
                </div>

                <div class="form-group col-sm-5">
                    <label for="update_peso_maximo">Peso máximo de decoalgem</label>
                    <input type="text" id="update_peso_maximo" placeholder="em quilogramas..." class="form-control" />
                </div>

                <div class="form-group col-sm-4">
                    <label for="update_nro_poltronas">Número de poltronas</label>
                    <input type="text" id="update_nro_poltronas" placeholder="" class="form-control" />
                </div>

                <div class="form-group col-sm-3">
                    <label for="update_autonomia">Autonomia</label>
                    <input type="text" id="update_autonomia" placeholder="em quilometros..." class="form-control" />
                </div>

                <div class="form-group col-sm-5">
                    <label for="update_capacidade_bagagem">Capacidade de Bagagem</label>
                    <input type="text" id="update_capacidade_bagagem" placeholder="em quilogramas..." class="form-control" />
                </div>

                <div class="form-group col-sm-4">
                    <label for="update_status">Status</label>
                    <select class="form-control" id="update_status">
                        <option value="ATIVO">Ativo</option>
                        <option value="EM_VOO">Em vôo</option>
                        <option value="EM_MANUTENCAO">Em manutenção</option>
                        <option value="SOB_PERICIA">Sob perícia</option>
                        <option value="INATIVO">Inativo</option>
                    </select>
                </div>

                <div class="form-group col-sm-8">
                    <label for="update_cnpj_companhia">Companhias</label>
                    <select class="form-control" id="update_cnpj_companhia">
                        <option value="selecione">Selecione...</option>
                        <?php
                            echo $optionsCompanhia;
                        ?>
                    </select>
                </div>
            </div>
                        <div class="tab-pane" id="tab_voos">
                            
                        </div>
                        <div class="tab-pane" id="tab_mecanicos">
                            
                        </div>
                    </div>
                </div>
                
            
            <div class="modal-footer">
                <button onclick="removeAeronave()" class="btn btn-danger">Deletar</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-success" onclick="atualizaAeronave()">Salvar mudanças</button>
            </div>
        </div>
    </div>
</div>
<!-- FIM Modal - Update Aeronave -->