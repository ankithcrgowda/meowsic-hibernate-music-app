<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User - Songs</title>
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

	.logout-btn {
		padding: 9px 18px;
		border-radius: 5px;
		font-size: 13px;
		font-weight: 500;
		text-decoration: none;
		cursor: pointer;
		transition: all 0.15s ease;
		position: relative;
		display: inline-block;
		background: linear-gradient(180deg, #e8e8e8 0%, #d0d0d0 50%, #c0c0c0 100%);
		color: #333;
		border: 1px solid #a8a8a8;
		box-shadow: 
			0 3px 8px rgba(0, 0, 0, 0.12),
			inset 0 1px 0 rgba(255, 255, 255, 0.6),
			inset 0 -1px 0 rgba(0, 0, 0, 0.1);
		text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	}

	.logout-btn::before {
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

	.logout-btn:hover {
		background: linear-gradient(180deg, #f0f0f0 0%, #d8d8d8 50%, #c8c8c8 100%);
	}

	.song-list {
		display: grid;
		grid-template-columns: 120px 1fr 1fr 350px;
		gap: 0;
		border: 1px solid #b0d4e3;
		border-radius: 6px;
		overflow: hidden;
		box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
		background: #ffffff;
	}

	.song-header {
		display: contents;
	}

	.song-header > div {
		background: linear-gradient(180deg, #d5ebf5 0%, #c0dff0 100%);
		color: #2c5f7c;
		padding: 12px 15px;
		font-weight: 600;
		font-size: 13px;
		letter-spacing: 0.3px;
		border-bottom: 2px solid #a0c8dc;
		text-shadow: 0 1px 0 rgba(255, 255, 255, 0.8);
	}

	.song-row {
		display: contents;
	}

	.song-row > div {
		padding: 15px;
		border-bottom: 1px solid #e0f0f8;
		color: #333;
		font-size: 14px;
		background: #ffffff;
		display: flex;
		align-items: center;
	}

	.song-row:hover > div {
		background: linear-gradient(180deg, #f8fcff 0%, #f0f8ff 100%);
	}

	.song-row:last-child > div {
		border-bottom: none;
	}

	.thumbnail {
		width: 80px;
		height: 80px;
		object-fit: cover;
		border-radius: 6px;
		box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
		border: 2px solid #e0f0f8;
	}

	audio {
		width: 100%;
		height: 32px;
		outline: none;
	}

	audio::-webkit-media-controls-panel {
		background: linear-gradient(180deg, #f5f5f5 0%, #e8e8e8 100%);
		border-radius: 4px;
		border: 1px solid #c0c0c0;
	}

	.song-title {
		font-weight: 500;
		color: #2c5f7c;
		word-wrap: break-word;
		overflow-wrap: break-word;
	}

	.song-artist {
		color: #666;
		word-wrap: break-word;
		overflow-wrap: break-word;
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

		.song-list {
			grid-template-columns: 1fr;
		}

		.song-header {
			display: none;
		}

		.thumbnail {
			width: 60px;
			height: 60px;
		}

		audio {
			width: 100%;
		}
	}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<h2>Available Songs</h2>
			<a href="../logout" class="logout-btn">Logout</a>
		</div>

		<div class="song-list">
			<div class="song-header">
				<div>Thumbnail</div>
				<div>Title</div>
				<div>Artist</div>
				<div>Play</div>
			</div>

			<c:forEach var="song" items="${songs}">
				<div class="song-row">
					<div>
						<img class="thumbnail" src="${pageContext.request.contextPath}${song.image_url}" alt="${song.title}">
					</div>
					<div class="song-title">${song.title}</div>
					<div class="song-artist">${song.artist}</div>
					<div>
						<audio controls controlsList="nodownload">
							<source src="${pageContext.request.contextPath}${song.file_name}" type="audio/mpeg">
							Your browser does not support the audio element.
						</audio>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>