@decrementStat = (statType, p_id, g_id, s_id) ->
  @statValue = 0
  @statInt = 0
  @statT = statType
  $.ajax
    type: "GET"
    url: "/stats/" + s_id + ".json"
    success: (data) ->
      switch statType
        when "goals"
          statValue = data.goals
        when "assists"
          statValue = data.assists
        when "turnovers"
          statValue = data.assists
        when "def_plays"
          statValue = data.def_plays
        else
          statValue = 0
      statInt = parseInt(statValue)
      unless statInt is 0
        statInt--
        if statType is "goals"
          $.ajax
            type: "PATCH"
            url: "/stats/" + s_id + ".json"
            data:
              stat:
                goals: statInt

            success: (data) ->
              $("#goal-g" + g_id + "-p" + p_id).text statInt 
              false

            error: (data) ->
              false

        if statType is "def_plays"
          $.ajax
            type: "PATCH"
            url: "/stats/" + s_id + ".json"
            data:
              stat:
                def_plays: statInt

            success: (data) ->
              $("#def-g" + g_id + "-p" + p_id).text statInt
              false

            error: (data) ->
              false

        if statType is "assists"
          $.ajax
            type: "PATCH"
            url: "/stats/" + s_id + ".json"
            data:
              stat:
                assists: statInt

            success: (data) ->
              $("#assist-g" + g_id + "-p" + p_id).text statInt
              false

            error: (data) ->
              false

        if statType is "turnovers"
          $.ajax
            type: "PATCH"
            url: "/stats/" + s_id + ".json"
            data:
              stat:
                turnovers: statInt

            success: (data) ->
              $("#turn-g" + g_id + "-p" + p_id).text statInt
              false

            error: (data) ->
              false 
 
@incrementStat = (statType, p_id, g_id, s_id) ->
  @statValue = 0
  @statInt = 0
  @statT = statType
  $.ajax
    type: "GET"
    url: "/stats/" + s_id + ".json"
    success: (data) ->
      switch statType
        when "goals"
          statValue = data.goals
        when "assists"
          statValue = data.assists
        when "turnovers"
          statValue = data.assists
        when "def_plays"
          statValue = data.def_plays
        else
          statValue = 0
      statInt = parseInt(statValue)
      statInt++
      if statType is "goals"
        $.ajax
          type: "PATCH"
          url: "/stats/" + s_id + ".json"
          data:
            stat:
              goals: statInt

          success: (data) ->
            $("#goal-g" + g_id + "-p" + p_id).text statInt 
            false

          error: (data) ->
            false

      if statType is "def_plays"
        $.ajax
          type: "PATCH"
          url: "/stats/" + s_id + ".json"
          data:
            stat:
              def_plays: statInt

          success: (data) ->
            $("#def-g" + g_id + "-p" + p_id).text statInt
            false

          error: (data) ->
            false

      if statType is "assists"
          $.ajax
            type: "PATCH"
            url: "/stats/" + s_id + ".json"
            data:
              stat:
                assists: statInt

            success: (data) ->
              $("#assist-g" + g_id + "-p" + p_id).text statInt
              false

            error: (data) ->
              false

        if statType is "turnovers"
          $.ajax
            type: "PATCH"
            url: "/stats/" + s_id + ".json"
            data:
              stat:
                turnovers: statInt

            success: (data) ->
              $("#turn-g" + g_id + "-p" + p_id).text statInt
              false

            error: (data) ->
              false
