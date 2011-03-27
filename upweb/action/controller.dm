
/**
 * Fundamental data type of a web interface.  Controllers are generally organized around
 * a particular data model, and is purposed to performing operations and actions
 * on that model.
 *
 * @type /_upweb/action/controller
 */
_upweb/action/controller
	parent_type = /_upweb/core/object
	var
		/**
		 * Stores data to be send to the view.  To be
		 * set in a controller action
		 *
		 * @type /list
		 */
		list/_data = list()

	/**
	 * Sends data from the controller to the view.
	 *
	 * Usage:
	 * 	send("name", "value")
	 * 	send(list("name1" = "value1, "name2" = "value2"))
	 */
	proc/send()
		if(istype(args[0], /list))
			return src._send_list(args[0])

		return src._send_name_value(args[0], args[1])

	/**
	 * Private interface for sending a single piece of data
	 * by name and value.
	 *
	 * @param name text Name of variable
	 * @param value text Value of variable
	 */
	proc/_send_name_value(name, value)
		src._data[name] = value

	/**
	 * Private interface for sending multiple pieces of data.
	 *
	 * @param _data /list Associative list of names and values to
	 * 	merge
	 */
	proc/_send_list(list/_data)
		for(var/name in _data)
			var/value = _data[name]
			src._send_name_value(name, value)
