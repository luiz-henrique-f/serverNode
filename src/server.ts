import { fastify } from "fastify";
import cors from '@fastify/cors'
import { PrismaClient } from '@prisma/client';

const server = fastify()

server.register(cors, {
    origin: '*'
})

const prisma = new PrismaClient({
    log: ['query']
})

server.get('/', (request, reply) => {
    return reply.send(JSON.stringify({ nome: 'Luiz' }))
})

server.post('/createUserGestao', async (request: any, response: any) => {
    const body = request.body

    const userExisting = await prisma.user.findUnique({
        where: { email: body.email },
        select: {email: true}
    })

    if (userExisting) {
        return response.code(409).header('Content-Type', 'application/json; charset=utf-8').send({ message: 'User already exists.' })
    }

    const create = await prisma.$queryRaw`INSERT INTO "public"."User"
                                                 (
                                                    "public"."User"."email"
                                                  , "public"."User"."name"
                                                  , "public"."User"."password"
                                                 )
                                           VALUES(
                                                    ${body.email}
                                                  , ${body.name}
                                                  , ${body.password}
                                                 )`

    // const create = await prisma.user.create({
    //     data: {
    //         email: body.email,
    //         name: body.name,
    //         password: body.password,
    //     }
    // })

    return response.code(201).header('Content-Type', 'application/json; charset=utf-8').send(create)
});

server.get('/loginGestao/:username', async (request: any, reply: any) => {
    const username = request.params.username;

    const user = await prisma.user.findUnique({
        where: { email: username }
    })

    // reply.code(409).header('Content-Type', 'application/json; charset=utf-8').send({ message: 'User not exists.' })

    if (!user) {
        return;
    }

    return user;
});

server.listen({
    host: '0.0.0.0',
    port: (process.env.PORT as any) ?? 3333,
}).then(() => {
    console.log('Server Running')
})