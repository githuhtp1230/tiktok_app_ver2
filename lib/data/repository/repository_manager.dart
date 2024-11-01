import 'package:tikok_app_ver2/data/repository/account/account_repository.dart';
import 'package:tikok_app_ver2/data/repository/comment/comment_repository.dart';
import 'package:tikok_app_ver2/data/repository/video/video_repository.dart';

class RepositoryManager {
  static AccountRepository get accountRepository => AccountRepository();
  static VideoRepository get videoRepository => VideoRepository();
  static CommentRepository get commentRepository => CommentRepository();
}