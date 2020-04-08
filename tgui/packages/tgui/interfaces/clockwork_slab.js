import { Section, Button, LabeledList } from "../components";


export const ClockworkSlab = props => {
  const { act, data } = useBackend(props);
  const recollection = data.recollection_categories || [];
  const scripture = data.scripture || [];
  return (
    <Section>
      <Button
        content = "Click1"
        onClick = {() => act(ref, "toggle", {data.recollection ? "Recital" : "Recollection"})}/>
    </Section>
    <Section>
      {!! data.recollection && (
        {data.rec_text}
        {recollection.map (
          <Button
            content = "Click3"
            onClick = {() => act(ref, "rec_category", {"category": "{name}"}>{name} - {desc} )}/>
        )}
        {data.rec_section}
        {data.rec_binds}
      )
    </Section>
    <Section>
      <LabeledList>
      {data.power}
      </LabeledList>
    </Section>
    <Section>
       <LabeledList>
      <Button
         content = "Click4"
         disabled = { data.selected == "Driver" ? "selected" : null }
         onClick = {() => act(ref, "select", {"category": "Driver"} >Driver< )}/>
      <Button
         content = "Click5"
         disabled = {data.selectedd == "Script" ? "selected" : null}
         onClick = {() => act(ref, "select", {"category" : "Script"} >Scripts< )}/>
      <Button
         content = "Click6"
         disabled = { data.selected == "Application" ? "selected" : null}
         onClick = {() => act(ref, "selected", {"category" : "Application"} >Applications<)}/>
      {data.tier_info}
      </LabeledList>
      <LabeledList>
        {data.scripturecolors}
      </LabeledList>
      <LabeledList>
        {scripture.map (
          <Button
            content = "Click7"
            tooltip = "{tip}"
            tooltipPosition = "right"
            onClick = {() => act(ref, "recite", {"category" : "{type}"}>Recite {required})}/>
            {!! quickbound && (
              {!! bound && (
                <Button
                  content = "Click8"
                  onClick = {() => arc(ref, "bind", {"category": "{type}" }>Unbind {bound})}/>
              ) || (
                <Button
                  content = "Click9"
                  onClick = {() => act(ref, "bind", {"category": "{type}"}> Quickbind)}/>
              )}
            )}
            {name} {descname} {invokers}
        )}
      </LabeledList>
    </Section>
      )}
  )
}
