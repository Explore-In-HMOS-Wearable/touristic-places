import { PlacesCardComponent } from '../components/PlacesCardComponent';
import { SearchBar } from '../components/SearchBar';
import { Places } from '../model/PlacesModel';
import { PlacesViewModel } from '../viewmodel/PlacesViewModel';

@Builder
export function PlacesPageBuilder() {
  PlacesPage()
}

@Entry
@Component
struct PlacesPage {
  scroller: Scroller = new Scroller()
  private viewModel: PlacesViewModel = new PlacesViewModel();
  searchInput: string = '';
  @State filteredPlacesList: Array<Places> = []
  @Consume('mainStack') pathStack: NavPathStack;

  private onSearch(searchInput: string) {
    this.viewModel.setSearchQuery(searchInput)
    this.filteredPlacesList = this.viewModel.getFilteredPlacesList()
  }

  aboutToAppear() {
    this.filteredPlacesList = this.viewModel.getFilteredPlacesList()
  }

  build() {
    NavDestination() {

      Column() {
        SearchBar({
          color: $r('app.color.start_window_background'),
          onSearch: (searchInput: string) => {
            this.onSearch(searchInput)
          },
          placeholder: $r('app.string.search')
        }).padding({ bottom: 3 })

        Scroll(this.scroller) {
          Column() {
            ForEach(this.filteredPlacesList, (menuItem: Places) => {
              PlacesCardComponent({
                placeImage: menuItem.image,
                name: menuItem.name,
                city: menuItem.city
              }).padding({ bottom: 4 })
              Divider().height(2).color(0xCCCCCC).padding({ left: 40, right: 40, bottom: 10 });
            }, (menuItem: Places, index: number) => menuItem.name)
          }.padding({ bottom: 25 })
        }.width('100%').height('100%')
      }.backgroundColor(Color.Transparent).padding({ top: 10, bottom: 10 }).width('100%').height('100%')
    }
    .hideBackButton(true)
  }
}