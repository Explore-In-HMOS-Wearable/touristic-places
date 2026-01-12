@Builder
export function HomePageBuilder() {
  HomePage()
}

@Entry
@Component
struct HomePage {
  @Consume('mainStack') pathStack: NavPathStack;

  build() {
    NavDestination() {

      Column() {

        Button($r('app.string.places'))
          .width('80%')
          .height(40)
          .margin(4)
          .onClick(() => {
            this.pathStack.pushPathByName('PlacesPage', null)
          })

        Button($r('app.string.notes'))
          .width('80%')
          .height(40)
          .margin(4)
          .onClick(() => {
            this.pathStack.pushPathByName('NotesPage', null)
          })

        Button($r('app.string.favorites'))
          .width('80%')
          .height(40)
          .margin(4)
          .onClick(() => {
            this.pathStack.pushPathByName('FavoritesPage', null)
          })

      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Black)

    }
    .hideBackButton(true)
  }
}
