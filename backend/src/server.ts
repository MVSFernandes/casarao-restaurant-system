import app from './app';
import http from 'http';
import { Server } from 'socket.io';
import { setupWebSocket } from './websocket/socket';

const PORT = process.env.PORT || 3001;

const server = http.createServer(app);

const allowedOrigins = process.env.FRONTEND_URL
  ? process.env.FRONTEND_URL.split(',')
  : ['http://localhost:3000', 'http://localhost:5173', 'http://localhost:4173'];

const io = new Server(server, {
  cors: {
    origin: allowedOrigins,
    methods: ['GET', 'POST'],
    credentials: true,
  },
});

// deixa o io disponível dentro dos controllers
app.set('io', io);

setupWebSocket(io);

server.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});