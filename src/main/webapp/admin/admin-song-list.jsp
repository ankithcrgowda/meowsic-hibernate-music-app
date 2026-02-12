<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Admin - Meowsic</title>
<style>
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}

	body {
		font-family: 'Segoe UI', 'Trebuchet MS', Tahoma, sans-serif;
		background: linear-gradient(180deg, #a8d8ea 0%, #d4f1f4 50%, #b8e6f0 100%);
		min-height: 100vh;
		padding: 30px 20px;
	}

	.container {
		max-width: 1200px;
		margin: 0 auto;
		background: linear-gradient(180deg, #ffffff 0%, #f0f8ff 100%);
		padding: 35px 40px;
		border-radius: 12px;
		box-shadow: 
			0 8px 24px rgba(0, 0, 0, 0.15),
			inset 0 1px 0 rgba(255, 255, 255, 0.8);
		border: 1px solid rgba(255, 255, 255, 0.6);
	}

	.header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 30px;
		padding-bottom: 20px;
		border-bottom: 1px solid #d0e8f2;
	}

	h2 {
		color: #2c5f7c;
		font-size: 26px;
		font-weight: 400;
		text-shadow: 0 1px 2px rgba(255, 255, 255, 0.8);
		letter-spacing: 0.5px;
	}

	.actions {
		display: flex;
		gap: 12px;
	}

	.btn {
		padding: 9px 18px;
		border-radius: 5px;
		font-size: 13px;
		font-weight: 500;
		text-decoration: none;
		cursor: pointer;
		transition: all 0.15s ease;
		position: relative;
		display: inline-block;
		text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	}

	.btn-primary {
		background: linear-gradient(180deg, #6db3d8 0%, #4a9bc7 50%, #3d8ab8 100%);
		color: white;
		border: 1px solid #3580a8;
		box-shadow: 
			0 3px 8px rgba(0, 0, 0, 0.15),
			inset 0 1px 0 rgba(255, 255, 255, 0.4),
			inset 0 -1px 0 rgba(0, 0, 0, 0.1);
	}

	.btn-primary::before {
		content: '';
		position: absolute;
		top: 1px;
		left: 1px;
		right: 1px;
		height: 50%;
		background: linear-gradient(180deg, rgba(255, 255, 255, 0.3) 0%, transparent 100%);
		border-radius: 4px 4px 0 0;
		pointer-events: none;
	}

	.btn-primary:hover {
		background: linear-gradient(180deg, #7dbee0 0%, #5ba8cf 50%, #4a96c2 100%);
		box-shadow: 
			0 4px 12px rgba(0, 0, 0, 0.2),
			inset 0 1px 0 rgba(255, 255, 255, 0.4),
			inset 0 -1px 0 rgba(0, 0, 0, 0.1);
	}

	.btn-secondary {
		background: linear-gradient(180deg, #e8e8e8 0%, #d0d0d0 50%, #c0c0c0 100%);
		color: #333;
		border: 1px solid #a8a8a8;
		box-shadow: 
			0 3px 8px rgba(0, 0, 0, 0.12),
			inset 0 1px 0 rgba(255, 255, 255, 0.6),
			inset 0 -1px 0 rgba(0, 0, 0, 0.1);
	}

	.btn-secondary::before {
		content: '';
		position: absolute;
		top: 1px;
		left: 1px;
		right: 1px;
		height: 50%;
		background: linear-gradient(180deg, rgba(255, 255, 255, 0.4) 0%, transparent 100%);
		border-radius: 4px 4px 0 0;
		pointer-events: none;
	}

	.btn-secondary:hover {
		background: linear-gradient(180deg, #f0f0f0 0%, #d8d8d8 50%, #c8c8c8 100%);
	}

	table {
		width: 100%;
		border-collapse: separate;
		border-spacing: 0;
		border: 1px solid #b0d4e3;
		border-radius: 6px;
		overflow: hidden;
		box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
	}

	th {
		background: linear-gradient(180deg, #d5ebf5 0%, #c0dff0 100%);
		color: #2c5f7c;
		padding: 12px 15px;
		text-align: left;
		font-weight: 600;
		font-size: 13px;
		letter-spacing: 0.3px;
		border-bottom: 2px solid #a0c8dc;
		text-shadow: 0 1px 0 rgba(255, 255, 255, 0.8);
	}

	td {
		padding: 12px 15px;
		border-bottom: 1px solid #e0f0f8;
		color: #333;
		font-size: 13px;
		background: #ffffff;
	}

	tr:hover td {
		background: linear-gradient(180deg, #f8fcff 0%, #f0f8ff 100%);
	}

	tr:last-child td {
		border-bottom: none;
	}

	.delete-link {
		color: #d84a4a;
		text-decoration: none;
		font-weight: 500;
		padding: 5px 12px;
		border-radius: 4px;
		transition: all 0.15s ease;
		display: inline-block;
	}

	.delete-link:hover {
		background: #ffe0e0;
		color: #c03030;
	}

	/* Responsive design */
	@media (max-width: 768px) {
		.container {
			padding: 25px 20px;
		}

		.header {
			flex-direction: column;
			align-items: flex-start;
			gap: 15px;
		}

		table {
			font-size: 12px;
		}

		th, td {
			padding: 8px 10px;
		}
	}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<h2>All Songs</h2>
			<div class="actions">
				<a href="add-song.jsp" class="btn btn-primary">Add New Song</a>
				<a href="../logout" class="btn btn-secondary">Logout</a>
			</div>
		</div>

		<table>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Artist</th>
				<th>File Path</th>
				<th>Thumbnail</th>
				<th>Action</th>
			</tr>

			<c:forEach var="song" items="${songs}">
				<tr>
					<td>${song.id}</td>
					<td>${song.title}</td>
					<td>${song.artist}</td>
					<td>${song.file_name}</td>
					<td>${song.image_url}</td>
					<td><a href="delete-song?id=${song.id}" class="delete-link">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>