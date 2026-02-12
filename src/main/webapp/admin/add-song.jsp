<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Song - Meowsic</title>
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
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 20px;
	}

	.container {
		background: linear-gradient(180deg, #ffffff 0%, #f0f8ff 100%);
		padding: 40px 45px;
		border-radius: 12px;
		box-shadow: 
			0 8px 24px rgba(0, 0, 0, 0.15),
			inset 0 1px 0 rgba(255, 255, 255, 0.8);
		width: 100%;
		max-width: 500px;
		border: 1px solid rgba(255, 255, 255, 0.6);
	}

	h2 {
		color: #2c5f7c;
		font-size: 28px;
		font-weight: 400;
		text-align: center;
		margin-bottom: 30px;
		text-shadow: 0 1px 2px rgba(255, 255, 255, 0.8);
		letter-spacing: 0.5px;
	}

	form {
		display: flex;
		flex-direction: column;
		gap: 18px;
	}

	.form-group {
		display: flex;
		flex-direction: column;
		gap: 6px;
	}

	label {
		color: #4a6b7c;
		font-size: 13px;
		font-weight: 500;
		letter-spacing: 0.3px;
	}

	input[type="text"] {
		padding: 10px 12px;
		border: 1px solid #b0d4e3;
		border-radius: 4px;
		font-size: 14px;
		font-family: 'Segoe UI', Tahoma, sans-serif;
		background: linear-gradient(180deg, #ffffff 0%, #f5fbff 100%);
		color: #333;
		box-shadow: 
			inset 0 1px 3px rgba(0, 0, 0, 0.08),
			0 1px 0 rgba(255, 255, 255, 0.8);
		transition: all 0.2s ease;
	}

	input[type="text"]:focus {
		outline: none;
		border-color: #5dade2;
		background: #ffffff;
		box-shadow: 
			inset 0 1px 3px rgba(0, 0, 0, 0.08),
			0 0 0 3px rgba(93, 173, 226, 0.15);
	}

	input[type="text"]::placeholder {
		color: #999;
		font-size: 13px;
	}

	button[type="submit"] {
		padding: 11px 24px;
		background: linear-gradient(180deg, #6db3d8 0%, #4a9bc7 50%, #3d8ab8 100%);
		color: white;
		border: 1px solid #3580a8;
		border-radius: 5px;
		font-size: 14px;
		font-weight: 500;
		cursor: pointer;
		margin-top: 8px;
		box-shadow: 
			0 3px 8px rgba(0, 0, 0, 0.15),
			inset 0 1px 0 rgba(255, 255, 255, 0.4),
			inset 0 -1px 0 rgba(0, 0, 0, 0.1);
		text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
		transition: all 0.15s ease;
		position: relative;
	}

	button[type="submit"]::before {
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

	button[type="submit"]:hover {
		background: linear-gradient(180deg, #7dbee0 0%, #5ba8cf 50%, #4a96c2 100%);
		box-shadow: 
			0 4px 12px rgba(0, 0, 0, 0.2),
			inset 0 1px 0 rgba(255, 255, 255, 0.4),
			inset 0 -1px 0 rgba(0, 0, 0, 0.1);
	}

	button[type="submit"]:active {
		background: linear-gradient(180deg, #4a9bc7 0%, #3d8ab8 50%, #3580a8 100%);
		box-shadow: 
			inset 0 2px 4px rgba(0, 0, 0, 0.2),
			0 1px 2px rgba(0, 0, 0, 0.1);
		transform: translateY(1px);
	}

	.back-link {
		display: block;
		text-align: center;
		margin-top: 20px;
		color: #4a9bc7;
		text-decoration: none;
		font-size: 13px;
		transition: color 0.2s ease;
	}

	.back-link:hover {
		color: #3580a8;
		text-decoration: underline;
	}

	/* Responsive design */
	@media (max-width: 480px) {
		.container {
			padding: 35px 30px;
		}

		h2 {
			font-size: 24px;
		}
	}
</style>
</head>
<body>
	<div class="container">
		<h2>Add Song</h2>
		<form action="add-song" method="post">
			<div class="form-group">
				<label for="title">Title:</label>
				<input type="text" name="title" id="title" required>
			</div>

			<div class="form-group">
				<label for="artist">Artist:</label>
				<input type="text" name="artist" id="artist" required>
			</div>

			<div class="form-group">
				<label for="filename">File Name:</label>
				<input type="text" name="filename" id="filename" placeholder="Example: /Songs/song name.mp3" required>
			</div>

			<div class="form-group">
				<label for="thumbnail">Thumbnail:</label>
				<input type="text" name="thumbnail" id="thumbnail" placeholder="Example: /thumbnails/song name.jpg">
			</div>

			<button type="submit">Add Song</button>
		</form>

		<a href="songs" class="back-link">← Back to Song List</a>
	</div>
</body>
</html>