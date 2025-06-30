function desenhar_robo(P)
    % Definição da base fixa triangular no plano Z=8
    base_z = 4;
    base_size = 1; % Base reduzida para inclinar mais os braços verdes

    % Coordenadas da base fixa (triângulo equilátero)
    base_x = base_size * [cos(0), cos(2*pi/3), cos(4*pi/3)];
    base_y = base_size * [sin(0), sin(2*pi/3), sin(4*pi/3)];
    base_z_vals = base_z * ones(size(base_x));

    % Definir pontos de interseção entre os braços superiores e inferiores
    joint_z = P(3) + 2;  % Mantém a interseção 2 unidades acima do ponto final
    joint_x = base_x * 1.5; % Mantém alinhado no mesmo plano de cada perna
    joint_y = base_y * 1.5; % Mantém cada par no mesmo plano

    % Criar a figura com mais espaço para visualização
    figure; hold on; grid on; view(3); axis equal;
    xlabel('X'); ylabel('Y'); zlabel('Z');
    xlim([-3, 3]); ylim([-3, 3]); zlim([0, 9]); % Aumenta a área visível

    % Desenhar a base fixa
    fill3([base_x base_x(1)], [base_y base_y(1)], [base_z_vals base_z_vals(1)], ...
          'k', 'FaceAlpha', 0.3, 'EdgeColor', 'k', 'LineWidth', 2);

    % Desenhar os braços superiores (verde) [Base fixa -> Ponto de interseção]
    for i = 1:3
        plot3([base_x(i), joint_x(i)], [base_y(i), joint_y(i)], [base_z, joint_z], ...
              'g', 'LineWidth', 2);
    end

    % Desenhar os braços inferiores (azul) [Ponto de interseção -> Ponto final]
    for i = 1:3
        plot3([joint_x(i), P(1)], [joint_y(i), P(2)], [joint_z, P(3)], ...
              'b', 'LineWidth', 2);
    end

    % Marcar o ponto final
    scatter3(P(1), P(2), P(3), 100, 'r', 'filled');

    title('Robô Delta - Movimento Automático');
end