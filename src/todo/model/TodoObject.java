package todo.model;

public class TodoObject {
	private int todoId;
	private String todoName;

	TodoObject(int id, String name) {
		todoId = id;
		todoName = name;
	}

	public int getId() {
		return todoId;
	}

	public String getName() {
		return todoName;
	}
}
