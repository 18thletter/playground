library playground.tests.domain.blog;

import 'package:playground/testing.dart';

main() {
  group('Post:', () {
    test('it is initialized correctly', () {
      var createdAt = new DateTime.now();
      var post = new Post(234, 'Story', 'Summer time.', createdAt);
      expect(post.id, 234);
      expect(post.title, 'Story');
      expect(post.body, 'Summer time.');
      expect(post.createdAt, createdAt);
    });
  });

  group('Post Repository:', () {
    test('it can store posts', (Repository<Post> postRepository) async {
      var post = await postRepository.get(1);
      expect(post, new isInstanceOf<Post>());
      expect(post.title, 'Hello world');
    }, bootstrap: bootstrap);
  });
}
