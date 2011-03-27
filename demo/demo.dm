
app/controllers
	parent_type = /_upweb/action/controller

app/views
	parent_type = /_upweb/template/view


app/controllers/clients_controller
	proc/settings(client/client)
		return list("client" = client)

app/views/clients
	settings
		render(list/params)
			var/client/C = params["client"]

			return {"
				Key: [C.key]
				Gender: [C.gender]
			"}
