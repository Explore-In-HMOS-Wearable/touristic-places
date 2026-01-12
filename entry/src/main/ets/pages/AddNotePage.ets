@Builder
export function AddNotePageBuilder() {
  AddNotePage()
}

@Entry
@Component
struct AddNotePage {
  @Consume('mainStack') pathStack: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        Text($r('app.string.add'))
          .fontSize(20)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
        Blank().height('1%')
        Divider()
          .color(Color.White)
        Blank().height('3%')
        Flex({ justifyContent: FlexAlign.Center }) {
          TextArea({ placeholder: $r('app.string.add_note') })
            .width('75%')
            .padding(3)
            .borderRadius(10)
            .height('100%')
            .backgroundColor('#ff5d5c5c')

        }
        .height('95%')

        Blank().height('4%')
        Button() {
          Image($rawfile('ic_add_note_save.png'))
            .width(30)
            .height(30)
        }
        .backgroundColor(Color.Green)
        .padding(3)
        .type(ButtonType.Normal)
        .borderRadius(100)
        .onClick(() => {
          this.pathStack.pushPathByName('NotesPage', null)
        })
      }
      .backgroundColor(Color.Black)
      .padding({
        top: '5%',
        bottom: '30%'
      })
      .height('100%')
      .width('100%')
    }
    .hideBackButton(true)
  }
}