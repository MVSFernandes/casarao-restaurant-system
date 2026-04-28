import { Server } from 'socket.io';

const menuUsers = new Set<string>();

export const setupWebSocket = (io: Server) => {
  io.on('connection', (socket) => {
    console.log('A user connected:', socket.id);

    // Cardápio Digital Realtime
    socket.on('joinMenu', () => {
      menuUsers.add(socket.id);
      io.emit('menuUsersUpdate', menuUsers.size);
    });

    socket.on('leaveMenu', () => {
      menuUsers.delete(socket.id);
      io.emit('menuUsersUpdate', menuUsers.size);
    });

    socket.on('disconnect', () => {
      console.log('User disconnected:', socket.id);
      if (menuUsers.has(socket.id)) {
        menuUsers.delete(socket.id);
        io.emit('menuUsersUpdate', menuUsers.size);
      }
    });

    // Notificações de Pedidos (Exemplo)
    socket.on('newOrder', (order) => {
        // Notifica a cozinha
        io.to('kitchen').emit('newOrderNotification', order);
        // Notifica o caixa
        io.to('cashier').emit('newOrderNotification', order);
    });

    // Salas para diferentes painéis
    socket.on('joinRoom', (room) => {
        socket.join(room); // 'kitchen', 'cashier', 'waiters'
        console.log(`User joined room: ${room}`);
    });


    socket.on('disconnect', () => {
      console.log('User disconnected');
      // Se o usuário estava no menu, decrementa a contagem
      // (requer lógica adicional para rastrear qual socket estava no menu)
    });
  });
};
