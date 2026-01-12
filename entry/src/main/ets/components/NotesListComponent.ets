import NotesModel from '../model/NotesModel';

@Component
export struct NotesListComponent {
  @Prop notes: Array<NotesModel>;
  private scroller: Scroller = new Scroller()

  @Builder
  itemEnd() {
    Row() {
      Button() {
        Image($rawfile('ic_notes_list_trash.png'))
          .width(20)
          .height(20)
      }
      .backgroundColor('#ffff0000')
      .padding(10)
      .type(ButtonType.Normal)
      .borderRadius(100)
      .margin(10)
    }
  }

  @Builder
  itemStart() {
    Row() {
      Button() {
        Image($rawfile('ic_notes_list_edit.png'))
          .width(20)
          .height(20)
      }
      .backgroundColor('#ffff9600')
      .padding(5)
      .type(ButtonType.Normal)
      .borderRadius(100)
      .margin({ left: 5 })
    }
  }

  build() {
    Column() {
      Blank().height(10)
      List({ space: 10, initialIndex: 0, scroller: this.scroller }) {
        ForEach(this.notes, (item: NotesModel, index: number) => {
          ListItem() {
            Text(item.content)
              .width('100%')
              .fontSize('14.00fp')
              .textAlign(TextAlign.Start)
              .padding(10)
          }
          .borderRadius(10)
          .backgroundColor('#ff3d8aff')
          .width('100%')
          .swipeAction({
            end: {
              builder: () => {
                this.itemEnd()
              },
              actionAreaDistance: 56
            },
            start: {
              builder: () => {
                this.itemStart()
              },
              actionAreaDistance: 56
            }
          })
          // Add bottom margin to the last item to make it visible
          .margin({ bottom: index === this.notes.length - 1 ? '45%' : '0' })
        }, (item: NotesModel) => item.id.toString())
      }
      .chainAnimation(true)
      .edgeEffect(EdgeEffect.Spring)
      .listDirection(Axis.Vertical)
      .width('80%')
      .height('100%')
      .borderRadius(10)
    }
    .width('100%')
  }
}