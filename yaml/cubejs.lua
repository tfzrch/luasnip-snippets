return {
  s({trig="cyc", name="cubejs-yml-column"}, fmt([[
    - name: {1}
      title: {2}
      sql: "{3}"
      type: {4}
  ]], {
    [1] = i(1, "dimension_name"),
    [2] = i(2, "title"),
    [3] = i(3, "sql"),
    [4] = i(4, "type")
  }))
}
