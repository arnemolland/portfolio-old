class Comment {
  final String commentator;
  final String comment;
  final String image;
  final DateTime date;

  Comment({String commentator, String comment, String image, DateTime date})
      : this.commentator = commentator ?? 'Jon Doe',
        this.comment = comment ?? 'Lovely!',
        this.image = image ?? 'https//picsum.photos/200',
        this.date = date ?? DateTime.now();
}
