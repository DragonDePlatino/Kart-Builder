
-- True if something is an error value.
function errored(error)
	return type(error) == 'table' and error.error ~= nil
end

-- Create an error.
function error_new(error, suberror)
	return {
		error = error,
		suberror = suberror
	}
end
