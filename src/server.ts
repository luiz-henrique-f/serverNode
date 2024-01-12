import { fastify } from "fastify";
import cors from '@fastify/cors'

const server = fastify()

server.register(cors, { 
    origin: '*'
  })

server.get('/', (request, reply) => {
    return reply.send(JSON.stringify({nome: 'Luiz'}))
})

server.listen({
    host: '0.0.0.0',
    port: (process.env.PORT as any) ?? 3333,
}).then(() => {
    console.log('Server Running')
})