import { NotesListComponent } from '../components/NotesListComponent';
import { NotesViewModel } from '../viewmodel/NotesViewModel';

@Builder
export function NotesPageBuilder() {
  NotesPage()
}

@Entry
@Component
struct NotesPage {
  private viewModel: NotesViewModel = new NotesViewModel();
  @Consume('mainStack') pathStack: NavPathStack;

  build() {
    NavDestination() {

      Row() {
        Column() {
          Row() {
            Text($r('app.string.notes'))
              .fontSize(20)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
            Blank().width('5%')
            Image($rawfile('ic_note_add.png'))
              .width(20)
              .padding({
                bottom: '1.5%'
              })
              .onClick(() => {
                this.pathStack.pushPathByName('AddNotePage', null)
              })
          }

          Blank().height('1%')
          Divider()
            .color(Color.White)
          NotesListComponent({ notes: this.viewModel.notes })
        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
      }
      .padding({
        top: '5%',
        bottom: '5%'
      })
      .backgroundColor(Color.Black)
      .alignItems(VerticalAlign.Top)
      .height('100%')
      .width('100%')
    }
    .hideBackButton(true)
  }
}