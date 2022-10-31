@external
def makeTags(tag: String[10], word: String[10]) -> String[50]:

  part: String[12] = concat("<",tag,">")
  part2: String[13] = concat("</",tag,">")
  total: String[50] = concat(part,word,part2)
  return (total)
