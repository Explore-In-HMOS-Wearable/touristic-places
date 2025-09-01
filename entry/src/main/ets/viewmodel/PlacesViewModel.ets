import { dummyPlaces, Places } from '../model/PlacesModel';

@Observed
export class PlacesViewModel {
  private _restaurantList: Array<Places> = dummyPlaces;
  private _filteredPlacesList: Array<Places> = dummyPlaces;
  private _searchQuery: string = '';

  getFilteredPlacesList(): Array<Places> {
    return this._filteredPlacesList;
  }

  getSearchQuery(): string {
    return this._searchQuery;
  }

  setSearchQuery(query: string): void {
    this._searchQuery = query;
    this._applyFilters();
  }

  private _applyFilters(): void {
    let filteredList = this._restaurantList;
    // Search for place name or city
    if (this._searchQuery.trim() !== '') {
      const query = this._searchQuery.toLowerCase();
      filteredList = filteredList.filter(
        (restaurant) => restaurant.name.toLowerCase().includes(query) || restaurant.city.toLowerCase().includes(query)
      );
    }
    this._filteredPlacesList = filteredList;
  }
}

