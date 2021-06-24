def cleanup_test_database
  connection = PG.connect(dbname: 'message_board_test')
  connection.exec("TRUNCATE TABLE posts")
end
