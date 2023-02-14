const String rootAssetsPath =
    'http://laboinspire-tech.ca/technotheque/VrInRehab/assets';

List<String> separateText(String text) {
  final List<String> out = [];
  var j = -2; // Start by simulating a \n
  var i = 0;

  do {
    i += j + 2; // Jump over the \n
    j = text.substring(i + 1).indexOf('\n');
    j = i + j + 2 >= text.length ? -1 : j;
    out.add(text.substring(i, j > 0 ? i + j + 1 : null));
  } while (j > 0);

  return out;
}
