open React

// Tipo do item
type item = {
  id: int,
  name: string,
  category: string,
}

let style: ReactDOM.Style.t = {
  display: "flex",
  gap: "8px",
}

@react.component
let make = () => {
  let (items, setItems) = useState(() => [])
  let (name, setName) = useState(() => "")
  let (category, setCategory) = useState(() => "Geral")

  let addItem = _ => {
    let trimmed = name->Js.String.trim
    if trimmed !== "" {
      let newItem: item = {
        id: Js.Math.random_int(0, 999999),
        name: trimmed,
        category: category,
      }

      setItems(prev => Array.concat(prev, [newItem]))
      setName(_ => "")
    }
  }

  let removeItem = id => {
    setItems(prev => prev->Array.filter(i => i.id !== id))
  }

  <div>
    <div style={style}>
      <input
        value=name
        placeholder="Novo item"
        onChange={event =>
          setName(_ => JsxEvent.Form.target(event)["value"])
        }
      />

      <select
        value=category
        onChange={(event =>
          setCategory(_ => JsxEvent.Form.target(event)["value"])
        )}
      >
        <option value="Geral"> {React.string("Geral")} </option>
        <option value="Mercado"> {React.string("Mercado")} </option>
        <option value="Higiene"> {React.string("Higiene")} </option>
        <option value="Limpeza"> {React.string("Limpeza")} </option>
      </select>

      <button onClick={addItem}>
        {React.string("Adicionar")}
      </button>
    </div>

    <ul>
      {items
      ->Array.map(i =>
        <li key={string_of_int(i.id)}>
          <input
            type_="checkbox"
            onChange={_ => removeItem(i.id)}
          />
          {React.string(i.name ++ " (" ++ i.category ++ ")")}
        </li>
      )
      ->React.array}
    </ul>
  </div>
}