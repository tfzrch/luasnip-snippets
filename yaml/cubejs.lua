return {
  s({trig="cyc", name="cubejs-yml-column"}, fmt([[
    - name: {1}
      title: {2}
      sql: "{3}"
      type: {4}
  ]], {
    [1] = i(1, "column_name"),
    [2] = i(2, "title"),
    [3] = i(3, "sql"),
    [4] = i(4, "type")
  })),
  s({trig="cube", name="cubejs-yml-cube"}, fmt([[
  cubes:
    - name: {1}
      data_source: "{2}"
      public: false
      sql_table: "public.\"{3}\""
      sql_alias: {4}

      joins: []

      dimensions: []

      measures: []

      segments: []

      pre_aggregations: []
  ]], {
    [1] = i(1, "cube"),
    [2] = i(2, "data_source"),
    [3] = i(3, "sql_table"),
    [4] = i(4, "sql_alias")
  }))
}
