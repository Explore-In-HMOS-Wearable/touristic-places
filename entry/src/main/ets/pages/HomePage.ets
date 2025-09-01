import { router } from '@kit.ArkUI'

@Entry
@Component
struct HomePage {
  build() {
    Column() {

      Button($r('app.string.places'))
        .width('80%')
        .height(40)
        .margin(4)
        .onClick(() => {
          router.pushUrl({ url: 'pages/PlacesPage' })
        })

      Button($r('app.string.notes'))
        .width('80%')
        .height(40)
        .margin(4)
        .onClick(() => {
          router.pushUrl({ url: 'pages/NotesPage' })
        })

      Button($r('app.string.favorites'))
        .width('80%')
        .height(40)
        .margin(4)
        .onClick(() => {
          router.pushUrl({ url: 'pages/FavoritesPage' })
        })

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Black)

  }
}
