import { fastify } from "fastify";

const server = fastify()

server.get('/', () => {
    return 'Hello'
})

server.listen({
    host: '0.0.0.0',
    port: (process.env.PORT as any) ?? 3333,
}).then(() => {
    console.log('Server Running')
})