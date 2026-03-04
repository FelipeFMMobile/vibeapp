# VibeApp

Aplicativo iOS construído em SwiftUI com organização em MVVM para evolução de telas e regras de negócio.

## Principais entregas desta sessão

- Estrutura inicial do app consolidada no GitHub em `master`.
- Primeiro commit definido com a mensagem:
  - `Meu primeiro Vibe Code app usando Codex no XCode`
- Histórico remoto integrado sem perda de conteúdo (`merge` com o commit inicial já existente no GitHub).
- Criação e integração da tela principal de disponibilidade:
  - `AvailabilityScreenView`
  - `AvailabilityScreenViewModel`
- `ContentView` ajustada para iniciar a experiência pela tela de disponibilidade.

## Padrão de projeto aplicado

- Arquitetura **MVVM** seguindo as diretrizes do projeto (`AGENTS.md`).
- ViewModel com `ObservableObject`, `@Published` e `viewState` com estados:
  - `idle`, `loading`, `success`, `error`
- View com `@StateObject` e sem lógica de negócio direta.
- Strings centralizadas no `ViewModel` via `enum Strings`.
- Nomenclatura padronizada com sufixos `View` e `ViewModel`.

## Integração com Figma

- Fluxo de trabalho preparado para integração com Figma via Codex + MCP (design-to-code).
- Ambiente já contempla habilidade dedicada para:
  - leitura de contexto de design
  - extração de variáveis e assets
  - apoio na tradução de componentes Figma para código SwiftUI

## Estrutura atual do projeto

- `VibeApp/ContentView.swift`
- `VibeApp/AvailabilityScreenView.swift`
- `VibeApp/AvailabilityScreenViewModel.swift`
- `VibeApp/VibeAppApp.swift`

