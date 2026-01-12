import NotesModel from '../model/NotesModel';

@Observed
export class NotesViewModel {
  notes: Array<NotesModel> = [
    new NotesModel('Don\'t forget to look at the opening hours of the Louvre Museum.', 1),
    new NotesModel('Remember to check the ticket prices for the Eiffel Tower before visiting.', 2)
  ];
}