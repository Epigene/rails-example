query = <<~HEREDOC
  SELECT t1.id
  FROM books t1
  LEFT OUTER JOIN books t2
    ON t1.author_id = t2.author_id AND
    (
      (t1.published_on < t2.published_on) OR
      (t1.published_on = t2.published_on AND t1.id < t2.id)
    )
  WHERE (
    t2.author_id IS NULL
  );
HEREDOC

query = query.gsub(%r'\n', ' ').gsub(%r'\s{2,}', ' ').strip

LAST_BOOK_QUERY = query.freeze
LAST_BOOK_QUERY3 = query.gsub(%r'\;.*\z', '').freeze
