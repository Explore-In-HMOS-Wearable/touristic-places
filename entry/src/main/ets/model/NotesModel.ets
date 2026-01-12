export default class NotesModel {
  id: number;
  content: string;

  constructor(content: string, id: number) {
    this.id = id;
    this.content = content;
  }
}