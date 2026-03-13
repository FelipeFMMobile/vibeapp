# VibeApp

[PT-BR](#pt-br) | [EN](#en)

## PT-BR

Aplicativo iOS construído em SwiftUI com organização em MVVM para evolução de telas e regras de negócio.

### Principais entregas desta sessão

- Estrutura inicial do app consolidada no GitHub em `master`.
- Primeiro commit definido com a mensagem `Meu primeiro Vibe Code app usando Codex no XCode`.
- Histórico remoto integrado sem perda de conteúdo com merge do commit inicial que já existia no GitHub.
- Criação e integração da tela principal de disponibilidade:
- `AvailabilityScreenView`
- `AvailabilityScreenViewModel`
- `ContentView` ajustada para iniciar a experiência pela tela de disponibilidade.

### Padrão de projeto aplicado

- Arquitetura `MVVM` seguindo as diretrizes do projeto em `AGENTS.md`.
- ViewModel com `ObservableObject`, `@Published` e `viewState` com estados `idle`, `loading`, `success` e `error`.
- View com `@StateObject` e sem lógica de negócio direta.
- Strings centralizadas no ViewModel via `enum Strings`.
- Nomenclatura padronizada com sufixos `View` e `ViewModel`.

### Integração com Figma

- Fluxo de trabalho preparado para integração com Figma via Codex + MCP no processo de design-to-code.
- Ambiente com habilidade dedicada para leitura de contexto de design, extração de variáveis e assets e apoio na tradução de componentes Figma para SwiftUI.

### Estrutura atual do projeto

- `VibeApp/ContentView.swift`
- `VibeApp/AvailabilityScreenView.swift`
- `VibeApp/AvailabilityScreenViewModel.swift`
- `VibeApp/VibeAppApp.swift`

### Próximos passos recomendados

- Criar testes unitários para todas as funções do `AvailabilityScreenViewModel`.
- Conectar ações de navegação (`Back` e `Next`) a um coordenador ou roteador.
- Evoluir a integração com Figma com mapeamento de componentes reutilizáveis.

## EN

iOS app built with SwiftUI and organized with MVVM to support screen evolution and business logic growth.

### Main work completed in this session

- Initial app structure was consolidated on GitHub in `master`.
- The first commit was defined with the message `Meu primeiro Vibe Code app usando Codex no XCode`.
- Remote history was integrated without losing content by merging the initial commit that already existed on GitHub.
- Creation and integration of the main availability screen:
- `AvailabilityScreenView`
- `AvailabilityScreenViewModel`
- `ContentView` was updated to start the app flow from the availability screen.

### Applied project pattern

- `MVVM` architecture following the project rules defined in `AGENTS.md`.
- ViewModel using `ObservableObject`, `@Published`, and `viewState` with the states `idle`, `loading`, `success`, and `error`.
- View using `@StateObject` with no direct business logic.
- Strings centralized inside the ViewModel through `enum Strings`.
- Standardized naming with `View` and `ViewModel` suffixes.

### Figma integration

- Workflow prepared for Figma integration through Codex + MCP in a design-to-code setup.
- The environment already includes a dedicated capability for reading design context, extracting variables and assets, and helping translate Figma components into SwiftUI code.

### Current project structure

- `VibeApp/ContentView.swift`
- `VibeApp/AvailabilityScreenView.swift`
- `VibeApp/AvailabilityScreenViewModel.swift`
- `VibeApp/VibeAppApp.swift`

### Recommended next steps

- Create unit tests for every function in `AvailabilityScreenViewModel`.
- Connect navigation actions (`Back` and `Next`) to a coordinator or router.
- Expand the Figma integration with reusable component mapping.
