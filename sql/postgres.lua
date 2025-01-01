return {
 s({trig="select *", name="select all starter query"}, fmt([[
  select
    *
  from public."{1}" as {2}
  where
    1=1
    and {3}
 ]], {
  [1] = i(1, "table"),
  [2] = i(2, "alias"),
  [3] = i(3, "condition")
 })),
 s({trig="join", name = "join"}, fmt([[
  {1} join public."{2}" as {3} on
    {4}.{5} = {6}.{7}
 ]], {
   [1] = c(1, {
     t("left"),
     t("inner"),
     t("full"),
     t("cross"),
     t("right")
   }),
   [2] = i(2, "table"),
   [3] = i(3, "alias"),
   [4] = i(4, "prior_alias"),
   [5] = i(5, "prior_key"),
   [6] = d(
     6,
     function(args)
       return sn(nil, {i(1, args[1])})
     end,
     {3}
   ),
   [7] = i(7, "current_key")
 })),
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
