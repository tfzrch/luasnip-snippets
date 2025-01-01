return {
 s({trig="extract", name="psql extract"}, fmt([[
  extract({1} from {2}){3}
 ]], {
  [1] = i(1, "element"),
  [2] = i(2, "column"),
  [3] = i(3, "cast")
 })),
 s({trig="arith", name="psql date arithmetic"}, fmt([[
  (
    extract({1} from {2})
    - extract({3} from {4})
  ){5}
 ]], {
  [1] = i(1, "element1"),
  [2] = i(2, "later"),
  [3] = i(3, "element2"),
  [4] = i(4, "earlier"),
  [5] = i(5, "cast")
 })),
 s({trig="div", name="psql divide"}, fmt([[
  / nullif({1}, 0)::{2}
 ]], {
  [1] = i(1, "column"),
  [2] = c(2, {t("numeric"), t("double precision"), t("float")})
 }))
}
