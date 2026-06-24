{
  electricity: {
    previous: (
      [.prices[] | .electricity.tariffs[] | select(.startDateTime == $prev)] | first |
      if . then {
        start: .startDateTime, total: .totalAmount, total_ex: .totalAmountEx,
        market: ((.groups // []) | map(select(.type == "MARKET_PRICE"))  | first | .amount // null),
        fee:    ((.groups // []) | map(select(.type == "PURCHASING_FEE")) | first | .amount // null),
        tax:    ((.groups // []) | map(select(.type == "TAX"))            | first | .amount // null)
      } else null end
    ),
    current: (
      [.prices[] | .electricity.tariffs[] | select(.startDateTime == $curr)] | first |
      if . then {
        start: .startDateTime, total: .totalAmount, total_ex: .totalAmountEx,
        market: ((.groups // []) | map(select(.type == "MARKET_PRICE"))  | first | .amount // null),
        fee:    ((.groups // []) | map(select(.type == "PURCHASING_FEE")) | first | .amount // null),
        tax:    ((.groups // []) | map(select(.type == "TAX"))            | first | .amount // null)
      } else null end
    ),
    next: (
      [.prices[] | .electricity.tariffs[] | select(.startDateTime == $next)] | first |
      if . then {
        start: .startDateTime, total: .totalAmount, total_ex: .totalAmountEx,
        market: ((.groups // []) | map(select(.type == "MARKET_PRICE"))  | first | .amount // null),
        fee:    ((.groups // []) | map(select(.type == "PURCHASING_FEE")) | first | .amount // null),
        tax:    ((.groups // []) | map(select(.type == "TAX"))            | first | .amount // null)
      } else null end
    ),
    today: (
      [.prices[] | select(.date == $today)] | first |
      if . then {
        min:     .electricity.minAmount,
        max:     .electricity.maxAmount,
        average: .electricity.averageAmount
      } else null end
    )
  },
  gas: {
    previous: (
      [.prices[] | (.gas // {tariffs:[]}) | .tariffs[] | select(.startDateTime == $prev)] | first |
      if . then {
        start: .startDateTime, total: .totalAmount, total_ex: .totalAmountEx,
        market: ((.groups // []) | map(select(.type == "MARKET_PRICE"))  | first | .amount // null),
        fee:    ((.groups // []) | map(select(.type == "PURCHASING_FEE")) | first | .amount // null),
        tax:    ((.groups // []) | map(select(.type == "TAX"))            | first | .amount // null)
      } else null end
    ),
    current: (
      [.prices[] | (.gas // {tariffs:[]}) | .tariffs[] | select(.startDateTime == $curr)] | first |
      if . then {
        start: .startDateTime, total: .totalAmount, total_ex: .totalAmountEx,
        market: ((.groups // []) | map(select(.type == "MARKET_PRICE"))  | first | .amount // null),
        fee:    ((.groups // []) | map(select(.type == "PURCHASING_FEE")) | first | .amount // null),
        tax:    ((.groups // []) | map(select(.type == "TAX"))            | first | .amount // null)
      } else null end
    ),
    next: (
      [.prices[] | (.gas // {tariffs:[]}) | .tariffs[] | select(.startDateTime == $next)] | first |
      if . then {
        start: .startDateTime, total: .totalAmount, total_ex: .totalAmountEx,
        market: ((.groups // []) | map(select(.type == "MARKET_PRICE"))  | first | .amount // null),
        fee:    ((.groups // []) | map(select(.type == "PURCHASING_FEE")) | first | .amount // null),
        tax:    ((.groups // []) | map(select(.type == "TAX"))            | first | .amount // null)
      } else null end
    ),
    today: (
      [.prices[] | select(.date == $today)] | first |
      if . then {
        min:     (.gas // {}).minAmount // null,
        max:     (.gas // {}).maxAmount // null,
        average: (.gas // {}).averageAmount // null
      } else null end
    )
  }
}
