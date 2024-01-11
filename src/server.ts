import { fastify } from "fastify";

const server = fastify()

server.get('/', () => {
    return 'Hello'
})

server.listen({
    port: (process.env.PORT as any) ?? 3333,
}).then(() => {
    console.log('Server Running')
})