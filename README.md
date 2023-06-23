# Limpeza Windows

Este repositório contém dois arquivos principais para realizar a limpeza de lixeira, pasta temp e outros diretórios de lixo do Windows.

## Arquivos

### LimparLixo.ps1

O arquivo LimparLixo.ps1 é um script PowerShell que automatiza o processo de limpeza. Ele oferece a funcionalidade de calcular o tamanho da lixeira, pasta temp e outras pastas adicionais, bem como permite que o usuário escolha se deseja limpar essas pastas ou cancelar a operação de limpeza.

#### Pré-requisitos

- PowerShell 5.1 ou superior.

#### Uso

1. Faça o download do arquivo LimparLixo.ps1 deste repositório.
2. Abra o PowerShell e navegue até o diretório onde o arquivo LimparLixo.ps1 está localizado.
3. Execute o seguinte comando:
    ```powershell
   .\LimparLixo.ps1
Isso iniciará o script de limpeza e exibirá informações sobre o tamanho da lixeira e da pasta temp. Em seguida, você será solicitado a confirmar se deseja limpar essas pastas.

4. Responda "S" para limpar as pastas (lixeira e pasta temp) ou "N" para cancelar a operação de limpeza.

### LimparLixo.bat

O arquivo LimparLixo.bat é um arquivo em lotes (batch) que fornece uma maneira conveniente de executar o script PowerShell LimparLixo.ps1. Ele lida com a configuração da codificação do console para suportar caracteres especiais corretamente durante a execução do script.

#### Pré-requisitos

- Windows com o interpretador de comandos em lotes (cmd).

#### Uso

1. Faça o download do arquivo LimparLixo.bat deste repositório.
2. Abra o prompt de comando e navegue até o diretório onde o arquivo LimparLixo.bat está localizado.
3. Execute o seguinte comando:
    ```batch
   LimparLixo.bat
Isso executará o arquivo em lotes, que por sua vez executará o script PowerShell LimparLixo.ps1. Siga as instruções exibidas no console para realizar a limpeza.

## Contribuição

Contribuições são bem-vindas! Se você tiver alguma melhoria, correção de bugs ou sugestão, sinta-se à vontade para abrir uma solicitação pull.

## Licença

Este projeto está licenciado sob a Licença MIT.
