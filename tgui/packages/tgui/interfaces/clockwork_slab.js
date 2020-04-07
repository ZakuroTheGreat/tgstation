<Section>
  <Button
    content = "Click"
    onClick={() => act(ref, 'toggle'>{{data.recollection ? "Recital":"Recollection"}})}/>
</Section>
{!! data.recollection (
  
)}
	 <ui-display>
		{{{data.rec_text}}}
		{{#each data.recollection_categories}}
			<br><ui-button action='rec_category' params='{"category": "{{name}}"}'>{{{name}}} - {{{desc}}}</ui-button>
		{{/each}}
		{{{data.rec_section}}}
		{{{data.rec_binds}}}
 	 </ui-display>
{{else}}
	<ui-display title='Power' button>
 	 <ui-section>
 	   {{{data.power}}}
 	 </ui-section>
	</ui-display>
	<ui-display>
		<ui-section>
			<ui-button state='{{data.selected == "Driver" ? "selected" : null}}' action='select' params='{"category": "Driver"}'>Driver</ui-button>
			<ui-button state='{{data.selected == "Script" ? "selected" : null}}' action='select' params='{"category": "Script"}'>Scripts</ui-button>
			<ui-button state='{{data.selected == "Application" ? "selected" : null}}' action='select' params='{"category": "Application"}'>Applications</ui-button>
			<br>{{{data.tier_info}}}
		</ui-section>
		<ui-section>
			{{{data.scripturecolors}}}
		</ui-section><hr>
		<ui-section>
		{{#each data.scripture}}
			<div><ui-button tooltip='{{{tip}}}' tooltip-side='right' action='recite' params='{"category": "{{type}}"}'>Recite {{{required}}}</ui-button>
		 	 {{#if quickbind}}
				{{#if bound}}
					<ui-button action='bind' params='{"category": "{{type}}"}'>Unbind {{{bound}}}</ui-button>
				{{else}}
					<ui-button action='bind' params='{"category": "{{type}}"}'>Quickbind</ui-button>
				{{/if}}
		  	{{/if}}
		  	{{{name}}} {{{descname}}} {{{invokers}}}</div>
		{{/each}}
		</ui-section>
	</ui-display>
{{/if}}
