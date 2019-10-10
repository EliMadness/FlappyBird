ScoreState = Class{__includes = BaseState}

function ScoreState:init()
  self.score = 0

  self.medals = {
    ['trophy'] = love.graphics.newImage('trophy.png'),
    ['trophy2'] = love.graphics.newImage('trophy2.png'),
    ['trophy3'] = love.graphics.newImage('trophy3.png')
  }
end

function ScoreState:enter(params)
  self.score = params.score
end

function ScoreState:update(dt)
  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('countdown')
  end
end

function ScoreState:render()
  -- simply render the score to the middle of the screen
  love.graphics.setFont(flappyFont)
  love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

  love.graphics.setFont(mediumFont)
  love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

  love.graphics.printf('Try Again? (Enter)', 0, 160, VIRTUAL_WIDTH, 'center')

  local to_draw = nil
  if self.score >= 50 then
    to_draw = 'trophy3'
  elseif self.score >= 30 then
    to_draw = 'trophy2'
  elseif self.score >= 10 then
    to_draw = 'trophy'
  end

  if to_draw then
    love.graphics.draw(self.medals[to_draw], VIRTUAL_WIDTH - self.medals[to_draw]:getWidth() - 10, 20)
  end
end