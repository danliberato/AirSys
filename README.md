-----------------------------------------
CONFIGURAÇÕES
Esse site requer um nível de aninhamento maior que o padrão
Procurar por "max_nesting_level" no arquivo php.ini, colocar um valor de, no mínimo, 20 e reiniciar o Apache

-----------------------------------------
USANDO O GIT:
• Clonando o repositório
- Criar pasta para o projeto e entrar nela (mkdir AirSys, cd AirSys)
- Inicializar Git (git init)
- Referenciar repositórios (git remote add airsys git@github.com:danliberato/AirSys)
- Clonar (baixar) o repositório remoto para o local (git pull airsys master)

• Adicionando mudanças
- Adicionar os arquivos ("git add nome-do-arquivo" OU "git add ." para adicionar todos)
- Commitar os arquivos (git commit -m "comentario sobre as mudanças efetuadas")

• Enviando mudanças
- Eenvia as mudanças para o servidor remoto (git push airsys master)

• Verificando mudanças
- Se durante o tempo em que fez o pull e o push outra pessoa que também participe do projeto fez alterações o push será rejeitado e será atualizar o projeto local antes de enviar novas alterações (git fetch master)