# 💈 Horizon Barber — Mobile & Web

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

Segunda avaliação da disciplina de **PPDM** (Programação de Dispositivos Móveis) do 3° Semestre do **SENAI "Roberto Mange"**. O **Horizon Barber** é uma solução completa para agendamentos em barbearias, focada em uma experiência fluida para o cliente.

## 🧾 Sobre o projeto

O Horizon Barber permite que clientes gerenciem seus cortes e serviços de forma autônoma. Além disso o projeto integra-se a uma API REST para persistência de dados.

### Principais Funcionalidades:
- **Autenticação:** Fluxo de Login e Cadastro com gestão de sessão via `AppSession`.
- **Agendamento em Passos:** Escolha de serviço a e campo de observações técnicas.
- **Gestão de Agendamentos:** Listagem em tempo real com opção de cancelamento e atualização.

---

## 🛠️ Tecnologias

- [Flutter](https://flutter.dev/) - Framework UI
- [Dart](https://dart.dev/) - Linguagem de programação
- [Http](https://pub.dev/packages/http) - Consumo de API REST

---

## 🚀 Como rodar

### Pré-requisitos
- Flutter SDK instalado e configurado.
- API Horizon Barber em execução (local ou via Render).

### Passo a passo
```bash
# 1. Clone o repositório
git clone https://github.com/Samuel-millerr/horizon-barber

# 2. Acesse a pasta do projeto
cd horizon-barber

# 3. Instale as dependências
flutter pub get

# 4. Rode o projeto
flutter run
